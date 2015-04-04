"use strict";

var calculations = require('../helpers/calculations'),
	elements = require('../elements'),
	battle = require('../battle');


module.exports = function(uid, battleData, characterData, monsterData, events, callback) {
	events.push({
		message: '[[of:battle_opponent_attack_failure, ' + monsterData.monster_name + ', ' + characterData.character_name + ']]',
		type: 'opponent:attack'
	});

	callback(false, {events: events});
};