"use strict";

var async = require('async'),
	db = require('./nodebb').db,
	calculations = require('./helpers/calculations'),
	character = require('./character'),
	config = require('./config'),
	elements = require('./elements'),
	equipment = require('./equipment'),
	inventory = require('./inventory'),
	items = require('./items'),
	monsters = require('./monsters'),
	battle = {};

battle.view = function(uid, callback) {
	character.getCharacterFields(uid, ['character_id', 'battle_id', 'character_name'], function(err, character) {
		if (!character || !character.character_id) {
			return callback(true, {});
		}

		if (!character.battle_id) {
			equipment.getEquippedItems(uid, function(err, items) {
				callback(err, {
					equipment_types: items,
					battle_id: 0
				});
			});
		} else {
			async.parallel({
				battle: function(next) {
					battle.getBattle(character.battle_id, next);
				},
				items: function(next) {
					inventory.getBattleItems(uid, next);
				}
			}, function(err, battleData) {
				var data = battleData.battle,
					monster = monsters.getMonsterByID(data.battle_opponent_id);

				data.battle_opponent_name = monster.monster_name;
				data.battle_opponent_img = monster.monster_img;
				data.character_name = character.character_name;
				data.items = battleData.items;

				callback(err, data);
			});
		}		
	});
};

battle.move = function(uid, move, mid, callback) {
	// check turn, == 2? opponent move

	var events = [];

	character.getCharacterData(uid, function(err, characterData) {
		battle.getBattle(characterData.battle_id, function(err, battleData) {
			var monsterData = monsters.getMonsterByID(battleData.battle_opponent_id);

			function saveEvents(err, events) {
				battle.setBattleField(characterData.battle_id, 'battle_text', JSON.stringify(events), function(err) {
					callback(err, events);
				});
			}

			switch (move) {
			case 'attack':
				items.getUserItem(mid, function(err, userItemData) {
					// check for duration and ownership here
					attack(uid, events, userItemData, battleData, characterData, monsterData, saveEvents);
				});
				break;
			case 'item':
				items.getUserItem(mid, function(err, userItemData) {
					// check for duration and ownership here
					useItem(uid, events, userItemData, battleData, characterData, monsterData, saveEvents);
				});
				break;
			case 'spell':
				items.getUserItem(mid, function(err, userItemData) {
					// check for duration and ownership here
					castSpell(uid, events, userItemData, battleData, characterData, monsterData, saveEvents);
				});
				break;
			case 'defend':
				defend(uid, events, battleData, characterData, monsterData, saveEvents);
				break;
			case 'flee':
				flee(uid, events, battleData, characterData, monsterData, saveEvents);
				break;
			}
		});
	});
};

battle.getBattleField = function(battle_id, field, callback) {
	db.getObjectField('of:battle:' + battle_id, field, callback);
};

battle.getBattleFields = function(battle_id, fields, callback) {
	db.getObjectFields('of:battle:' + battle_id, fields, callback);
};

battle.setBattleField = function(battle_id, field, value, callback) {
	db.setObjectField('of:battle:' + battle_id, field, value, callback);
};

battle.setBattleFields = function(battle_id, data, callback) {
	db.setObject('of:battle:' + battle_id, data, callback);
};

battle.getBattle = function(battle_id, callback) {
	db.getObject('of:battle:' + battle_id, callback);
};

battle.deleteBattle = function(battle_id, callback) {
	db.delete('of:battle:' + battle_id, callback);
};

battle.incrementBattleFieldBy = function(battle_id, field, value, callback) {
	db.incrObjectFieldBy('of:battle:' + battle_id, field, value, callback);
};

battle.decrementBattleFieldBy = function(battle_id, field, value, callback) {
	db.incrObjectFieldBy('of:battle:' + battle_id, field, -value, callback);
};

battle.initialize = function(uid, callback) {
	createBattle(uid, function(err, battle_data) {
		db.incrObjectField('of:global', 'nextBattleID', function(err, battle_id) {
			battle_data.battle_id = battle_id;

			battle.setBattleFields(battle_id, battle_data, function(err) {
				character.setCharacterField(uid, 'battle_id', battle_id, callback);	
			});
		});
	});
};

function createBattle(uid, callback) {
	var events = [];

	async.parallel({
		equipment: function(next) {
			equipment.getEquippedItems(uid, next);
		},
		character: function(next) {
			character.getCharacterData(uid, next);
		}
	}, function(err, data) {
		var character = data.character,
			equipment = data.equipment;

		var eligibleMonsters = monsters.getMonstersByLevel(character.character_level);
		if (!eligibleMonsters.length) {
			return callback(true, '[[of:no_monsters]]');
		}

		var monster = eligibleMonsters[Math.floor(Math.random() * eligibleMonsters.length)];

		events.push({
			message: '[[of:battle_start, ' + monster.monster_name + ']]'
		});

		if (parseInt(monster.monster_level, 10) < parseInt(character.character_level, 10)) {
			// Xanathis' version:
			// var modifier = ((config.get('battle_monster_stats_modifier') -100) /100) *(level - monster_level) +1;
			// Vanilla ADR version:
			var modifier = (config.get('battle_monster_stats_modifier') /100) * (character.character_level - monster.monster_level);

			monster.monster_base_hp = Math.ceil(monster.monster_base_hp * modifier);
			monster.monster_base_att = Math.ceil(monster.monster_base_att * modifier);
			monster.monster_base_def = Math.ceil(monster.monster_base_def * modifier);
			monster.monster_base_mp = Math.ceil(monster.monster_base_mp * modifier);
			monster.monster_base_magic_attack = Math.ceil(monster.monster_base_magic_attack * modifier);
			monster.monster_base_magic_resistance = Math.ceil(monster.monster_base_magic_resistance * modifier);
		}

		var battle = {
			battle_challenger_id: uid,
			battle_type: 'PvE', // hardcoded to PvE for now
			battle_start: (new Date()).getTime(), // only used in PvP to compare against items bought afterwards
			battle_result: 0,
			battle_opponent_id: monster.monster_id,
			battle_opponent_hp: monster.monster_base_hp,
			battle_opponent_hp_max: monster.monster_base_hp,
			battle_opponent_mp: monster.monster_base_mp,
			battle_opponent_mp_max: monster.monster_base_mp,
			battle_opponent_mp_power: monster.monster_base_mp_power, // a PvE-only stat - is also spell's mp cost
			battle_opponent_att: monster.monster_base_att,
			battle_opponent_def: monster.monster_base_def,
			battle_opponent_element: monster.monster_base_element,
			battle_opponent_magic_attack: monster.monster_base_magic_attack,
			battle_opponent_magic_resistance: monster.monster_base_magic_resistance
		};

		battle.battle_challenger_att = calculations.calculateBaseAttack(character.character_might, character.character_constitution);
		battle.battle_challenger_def = calculations.calculateBaseDefense(character.character_ac, character.character_dexterity);
		battle.battle_challenger_magic_attack = calculations.calculateBaseMagicAttack(character.character_intelligence);
		battle.battle_challenger_magic_resistance = calculations.calculateBaseMagicResistance(character.character_wisdom);

		battle.battle_challenger_hp = parseInt(character.character_hp, 10);
		battle.battle_challenger_hp_max = parseInt(character.character_hp, 10);
		battle.battle_challenger_mp = parseInt(character.character_mp, 10);
		battle.battle_challenger_mp_max = parseInt(character.character_mp, 10);
		battle.battle_challenger_element = parseInt(character.character_element, 10);

		for (var type in equipment) {
			if (equipment.hasOwnProperty(type)) {
				var item = equipment[type].equipped,
					namespace = 'battle_challenger_' + equipment[type].item_base_stat,
					baseStat = battle[namespace];

				if (baseStat && !isNaN(parseFloat(baseStat)) && isFinite(baseStat) && item.item_power) {
					battle[namespace] = parseInt(battle[namespace], 10) + parseInt(item.item_power, 10);
				}
			}
		}

		
		// initiative check
		var monster_dex = (10 + Math.floor(Math.random() * monster.monster_level) * 2), //temp -- psychobunny: this thing must have been "temp" for the last 10 years
			challenger_init_check = Math.floor(Math.random() * 20) + calculations.calculateModifier(character.character_dexterity),
			monster_init_check = Math.floor(Math.random() * 20) + calculations.calculateModifier(monster_dex);

		battle.battle_turn = (challenger_init_check >= monster_init_check) ? 1 : 2;

		if (battle.battle_turn === 2) {
			events.push({
				message: '[[of:battle_msg_monster_start, ' + monster.monster_name + ']]'
			});
		}

		battle.battle_text = JSON.stringify({events: events});

		callback(err, battle);
	});
}

function incrementTurn(battle_id, callback) {
	battle.incrementBattleFieldBy(battle_id, 'turn', 1, function(err, turn) {
		if (turn % 2 === 1) {
			battle.incrementBattleFieldBy(battle_id, 'round', 1, callback);
		} else {
			callback(err);
		}
	});
}

function win(uid, challenger_id, callback) {

}

function lose(uid, challenger_id, callback) {
	callback(null, {});
}

function attack(uid, events, userItem, battleData, character, monster, callback) {
	var weap = parseInt(userItem.item_id, 10),
		power = 1,
		quality = 0;

	// temp
	events.push({
		message: '[[of:battle_opponent_attack_failure, ' + monster.monster_name + ', ' + character.character_name + ']]'
	});

	battleData.battle_challenger_att = parseInt(battleData.battle_challenger_att, 10);
	battleData.battle_opponent_def = parseInt(battleData.battle_opponent_def, 10);

	if (weap > 0) {
		// this code doubled quality for magic items. seemingly unnecessary why not do this in ACP for transparency?
		// quality = (userItem['item_type_use'] == '6') ? (userItem['item_quality'] *2) : userItem['item_quality'];
		quality = parseInt(userItem.item_quality, 10);
		power = parseInt(userItem.item_power, 10) + parseInt(userItem.item_add_power, 10);
		// todo helpers.reduceDurability(weap , user_id);
	}

	// Let's check if the attack succeeds
	var dice = Math.floor(Math.random() * 20) + 1,
		// previous hit code added character.character_level to both sides of the equation. o_O unintentional?
		diff = ((battleData.battle_challenger_att + quality + dice) > (battleData.battle_opponent_def)) ? true : false,
		damage = 1;

	power = power + calculations.calculateModifier(character.character_might);


	// Grab details for Elemental addon
	var elemental = elements.getElementByID(battleData.battle_opponent_element);

	// Grab item element infos if isn't a bare hands strike
	var element_name = (userItem.item_id > 0) ? elements.getElementByID(userItem.item_element) : null;

	// Here we apply text colour if set
	if (elemental.element_colour !== null){
		userItem.item_name = '<font color="' + elemental.element_colour + '">' + userItem.item_name + '</font>';
	}

	// not sure about giving magic weaps more threat, circuling back to this later.
	//$threat_range = ($item['item_type_use'] == '6') ? '19' : '20'; // magic weaps get slightly better threat range
	var threat_range = 20;
	//var crit_result = adr_battle_make_crit_roll(bat['battle_challenger_att'], challenger['character_level'], bat['battle_opponent_def'], item['item_type_use'], power, quality, threat_range);
	var crit_result = false;

	// Bare fist strike
	if (userItem.item_id === 0){
		var monster_def_dice = Math.floor(Math.random() * 20) + 1,
			monster_modifier = 0; // this is temp. until proper monster characteristics are added to ADR

		// Grab modifers
		var bare_power = calculations.calculateModifier(character.character_might);

		if((((dice + bare_power) >= (monster_def_dice + monster_modifier)) && (dice !== 1)) || (dice === 20)){
			damage = Math.floor(Math.random() * 3) + 1;
			damage = (damage > battleData.battle_opponent_hp) ? battleData.battle_opponent_hp : damage;
			events.push({
				message: '[[of:battle_attack_bare, ' + character.character_name + ', ' + damage + ', ' + monster.monster_name + ']]'
			});
		} else {
			damage = 0;
			events.push({
				message: '[[of:battle_attack_bare_fail, ' + character.character_name + ', ' + monster.monster_name + ']]'
			});
		}
	} else {
		if(((diff === true) && (dice !== 1)) || (dice >= threat_range)){
			// Prefix msg if crit hit
			//battle_message += (crit_result === true) ? '<br>' + '[[of:battle_critical_hit]]' + '</b><br />' : '';
			damage = 1;

			// Work out attack type
			if((userItem.item_element) && (userItem.item_element === elemental.element_oppose_strong) && (userItem.item_duration > '1') && (userItem.item_id > 0)){
				damage = Math.ceil((power *(userItem.item_element_weak_dmg /100)));
			} else if((userItem.item_element) && (userItem.item_id > 0) && (userItem.item_element === battleData.battle_opponent_element) && (userItem.item_duration > '1')){
				damage = Math.ceil((power *(userItem.item_element_same_dmg /100)));
			} else if((userItem.item_element) && (userItem.item_id > 0) && (userItem.item_element === elemental.element_oppose_weak) && (userItem.item_duration > '1')){
				damage = Math.ceil((power *(userItem.item_element_str_dmg /100)));
			} else {
				damage = Math.ceil(power);
			}

			// Fix dmg value
			damage = (damage < '1') ? Math.floor(Math.random() * 3) + 1 : damage;
			damage = (damage > battleData.battle_opponent_hp) ? battleData.battle_opponent_hp : damage;

			// Fix attack msg type
			if((userItem.item_element > '0') && (typeof elemental.element_name !== 'undefined')){
				elemental.element_name = 'Fire'; // todo: translator.translate this
				userItem.item_name = 'Sword';  // todo: translator.translate this
				events.push({
					message: '[[of:battle_attack_success, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ', ' + elemental.element_name + ', ' + damage + ']]'
				});
			} else {
				userItem.item_name = 'Sword';  // todo: translator.translate this
				events.push({
					message: '[[of:battle_attack_success_norm, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ', ' + damage + ']]'
				});
			}
		} else {
			damage = 0;
			userItem.item_name = 'Sword';  // todo: translator.translate this
			events.push({
				message: '[[of:battle_attack_failure, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ']]'
			});
		}
	}

	battle.decrementBattleFieldBy(battleData.battle_id, 'battle_opponent_hp', damage, function() {
		callback(null, {events: events});
	});
}

function useItem(uid, events, userItemData, battleData, characterData, monsterData, callback) {
	callback(null, {});
}

function castSpell(uid, events, userItemData, battleData, characterData, monsterData, callback) {
	callback(null, {});
}

function flee(uid, events, battleData, characterData, monsterData, callback) {
	var dice = Math.floor(Math.random() * 20) + 1,
		monster_dice = Math.floor(Math.random() * 20) + 1;


	// To flee you must roll higher than opponent or roll straight 20. 1 = auto fail
	if((dice > monster_dice && dice !== 1) || (dice === 20)) {
		// todo:
		// Delete stolen items
		// Delete broken items
		events.push({
			message: '[[of:battle_flee, <strong>' + characterData.character_name + '</strong>]]'
		});

		async.parallel([
			function(next) {
				character.incrementCharacterFieldBy(uid, 'character_flees', 1, next);
			},
			function(next) {
				character.deleteObjectField(uid, 'battle_id', next);
			},
			function(next) {
				battle.deleteBattle(battleData.battle_id, next);
			}
		], function(err) {
			if (err) {
				throw new Error('Unable to flee: ' + err);
			}

			callback(err, {events: events, finished: 1});
		});
	} else {
		events.push({
			message: '[[of:battle_flee_fail, <strong>' + characterData.character_name + '</strong>]]'
		});

		incrementTurn(battleData.battle_id, function(err, turn) {
			// if turn % 2 === 0, --> opponentTurn, but only if he didn't move already... hmmm...
			callback(err, {events: events});
		});
	}
}

function defend(uid, events, battleData, characterData, monsterData, callback) {
	events.push({
		message: '[[of:battle_defend, <strong>' + characterData.character_name + '</strong>, <strong>' + monsterData.monster_name + '</strong>]]'
	});

	incrementTurn(battleData.battle_id, function(err, turn) {
		callback(err, {events: events});
	});
}

function opponentTurn(uid) {

}


module.exports = battle;