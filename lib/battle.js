"use strict";

var async = require('async'),
	db = require('./nodebb').db,
	calculations = require('./helpers/calculations'),
	character = require('./character'),
	elements = require('./elements'),
	equipment = require('./equipment'),
	inventory = require('./inventory'),
	items = require('./items'),
	monsters = require('./monsters'),
	nodebb = require('./nodebb'),
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
				},
				profile_image: function(next) {
					nodebb.user.getUserField(uid, 'picture', next);
				}
			}, function(err, battleData) {
				var data = battleData.battle,
					monster = monsters.getMonsterByID(data.battle_opponent_id);

				data.battle_opponent_name = monster.monster_name;
				data.battle_opponent_img = monster.monster_img;
				data.character_name = character.character_name;
				data.items = battleData.items;

				data.profile_image = battleData.profile_image;

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
				if (!result.events) {
					throw new Error('Refusing to save battle sequence. Improper format: ' + result);
				}

				battle.getVitalFields(characterData.battle_id, function(err, data) {
					result.data = data;

					battle.setBattleField(characterData.battle_id, 'battle_text', JSON.stringify(result), function(err) {
						if (!result.finished) {
							return callback(err, result);
						} 
						
						battle.endBattle(uid, battleData.battle_id, false, function() {
							callback(err, result);
						});
					});
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

battle.endBattle = function(uid, battle_id, win, callback) {
	// todo: IF !win
		// Delete stolen items
		// Delete broken items

	async.parallel([
		function(next) {
			character.deleteObjectField(uid, 'battle_id', next);
		},
		function(next) {
			battle.deleteBattle(battle_id, next);
		}
	], callback);
};

battle.getVitalFields = function(battle_id, callback) {
	battle.getBattleFields(battle_id, [
		'battle_opponent_hp',
		'battle_opponent_hp_max',
		'battle_opponent_mp',
		'battle_opponent_mp_max',
		'battle_challenger_hp',
		'battle_challenger_hp_max',
		'battle_challenger_mp',
		'battle_challenger_mp_max'
	], callback);
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