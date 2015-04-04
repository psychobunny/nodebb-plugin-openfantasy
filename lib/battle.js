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
	var events = [];

	character.getCharacterData(uid, function(err, characterData) {
		battle.getBattle(characterData.battle_id, function(err, battleData) {
			var monsterData = monsters.getMonsterByID(battleData.battle_opponent_id),
				sequence = [
					function(data, next) {
						if (typeof next !== 'function') {
							next = data;
						} else if (data.finished === 1) {
							return next(true, data);
						}

						battle.incrementBattleFieldBy(battleData.battle_id, 'battle_turn', 1, function(err) {
							if (err) {
								throw new Error('Unable to increment battle turn');
							}

							characterTurn(battleData, characterData, monsterData, next);
						});
					},
					function(data, next) {
						if (typeof next !== 'function') {
							next = data;
						} else if (data.finished === 1) {
							return next(true, data);
						}

						battle.incrementBattleFieldBy(battleData.battle_id, 'battle_turn', 1, function(err) {
							if (err) {
								throw new Error('Unable to increment battle turn');
							}

							require('./battle/opponent')(uid, battleData, characterData, monsterData, events, next);
						});
					}
				];

			if (parseInt(battleData.battle_turn, 10) % 2 === 0) {
				sequence = sequence.reverse(); // opponent initiative
			}

			async.waterfall(sequence, function(err, result) {
				battle.setBattleField(characterData.battle_id, 'battle_text', JSON.stringify(result), function(err) {
					callback(err, result);
				});
			});
		});
	});

	function characterTurn(battleData, characterData, monsterData, callback) {
		switch (move) {
		case 'attack':
			items.getUserItem(mid, function(err, userItemData) {
				// check for duration and ownership here
				require('./battle/attack')(uid, events, userItemData, battleData, characterData, monsterData, callback);
			});
			break;
		case 'item':
			items.getUserItem(mid, function(err, userItemData) {
				// check for duration and ownership here
				useItem(uid, events, userItemData, battleData, characterData, monsterData, callback);
			});
			break;
		case 'spell':
			items.getUserItem(mid, function(err, userItemData) {
				// check for duration and ownership here
				castSpell(uid, events, userItemData, battleData, characterData, monsterData, callback);
			});
			break;
		case 'defend':
			defend(uid, events, battleData, characterData, monsterData, callback);
			break;
		case 'flee':
			require('./battle/flee')(uid, events, battleData, characterData, monsterData, callback);
			break;
		}
	}
};

battle.initialize = function(uid, callback) {
	require('./battle/initialize')(uid, function(err, battle_data) {
		db.incrObjectField('of:global', 'nextBattleID', function(err, battle_id) {
			battle_data.battle_id = battle_id;

			battle.setBattleFields(battle_id, battle_data, function(err) {
				character.setCharacterField(uid, 'battle_id', battle_id, callback);	
			});
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




function win(uid, challenger_id, callback) {

}

function lose(uid, challenger_id, callback) {
	callback(null, {});
}

function useItem(uid, events, userItemData, battleData, characterData, monsterData, callback) {
	callback(null, {});
}

function castSpell(uid, events, userItemData, battleData, characterData, monsterData, callback) {
	callback(null, {});
}



function defend(uid, events, battleData, characterData, monsterData, callback) {
	events.push({
		message: '[[of:battle_defend, <strong>' + characterData.character_name + '</strong>, <strong>' + monsterData.monster_name + '</strong>]]'
	});

	callback(false, {events: events});
}


module.exports = battle;