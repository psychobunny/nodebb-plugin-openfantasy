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
			equipment.view(uid, function(err, items) {
				callback(err, {
					equipment_types: items.equipment_types,
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

};

function createBattle(uid, callback) {

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