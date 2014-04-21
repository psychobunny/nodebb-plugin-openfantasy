"use strict";

var db = require('./nodebb').db,
	character = require('./character'),
	equipment = require('./equipment'),
	battle = {};

battle.view = function(uid, callback) {
	character.getCharacterFields(uid, ['character_id', 'battle_id'], function(err, data) {
		if (!data || !data.character_id) {
			return callback(true, {});
		}

		if (!data.battle_id) {
			equipment.getEquippedItems(uid, function(err, items) {
				callback(err, {
					equipment_types: items,
					battle_id: 0
				});
			});
		} else {
			battle.getBattle(data.battle_id, callback);
		}		
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

battle.incrementBattleFieldBy = function(battle_id, field, value, callback) {
	db.incrObjectFieldBy('of:battle:' + battle_id, field, value, callback);
};

battle.decrementBattleFieldBy = function(battle_id, field, value, callback) {
	db.incrObjectFieldBy('of:battle:' + battle_id, field, -value, callback);
};

battle.enterBattle = function(uid, callback) {
	createBattle(uid, function(err, battle_data) {
		db.incrObjectField('of:global', 'nextBattleID', function(err, battle_id) {
			battle_data.battle_id = battle_id;

			battle.setBattleFields(battle_id, battle, function(err) {
				character.setCharacterField(uid, 'battle_id', callback);	
			});
		});
	});
};

function createBattle(uid, callback) {
	/*var battle = {
		character_id: uid,
		battle_id: battle_id,
		battle_type,
		battle_start,
		battle_turn,
		battle_result,
		battle_text,
		battle_challenger_id,
		battle_challenger_hp,
		battle_challenger_mp,
		battle_challenger_att,
		battle_challenger_def,
		battle_challenger_element,
		battle_challenger_magic_attack,
		battle_challenger_magic_resistance,
		battle_challenger_equipment_info,
		battle_opponent_id,
		battle_opponent_hp,
		battle_opponent_hp_max,
		battle_opponent_mp,
		battle_opponent_mp_max,
		battle_opponent_mp_power,
		battle_opponent_att,
		battle_opponent_def,
		battle_opponent_element,
		battle_opponent_magic_attack,
		battle_opponent_magic_resistance,
		battle_opponent_sp
	};*/
}

function incrementTurn(uid, callback) {

}

function flee(uid, callback) {

}

function win(uid, challenger_id, callback) {

}

function lose(uid, challenger_id, callback) {

}

function attack(uid, item_id, callback) {

}

function opponent_turn(uid) {

}


module.exports = battle;