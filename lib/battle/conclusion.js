"use strict";


var conclusion = {},
	config = require('../config'),
	async = require('async'),
	character = require('../character');


conclusion.reward = function(uid, events, battleData, characterData, monster, callback) {
	async.parallel({
		exp: function(next) {
			rewardExp(uid, characterData, monster, next);
		},
		sp: function(next) {
			rewardSP(uid, characterData, monster, next);
		},
		reward: function(next) {
			rewardPoints(uid, characterData, monster, next);
		}
	}, function(err, data) {
		events.push({
			message: '[[of:battle_won, ' + data.exp + ', ' + data.sp + ', ' + data.reward + ', {l_points}]]'
		});

		callback(err, events);
	});
};

function rewardExp(uid, characterData, monster, callback) {
	var max_exp = parseInt(config.get('battle_base_exp_max'), 10),
		min_exp = parseInt(config.get('battle_base_exp_min'), 10);

	var exp = Math.floor(Math.random() * (max_exp - min_exp)) + min_exp;

	if ((monster.monster_level - characterData.character_level) > 1) {
		exp = Math.floor((monster.monster_level - characterData.character_level) * config.get('battle_base_exp_modifier') / 100 );
	}

	character.incrementCharacterFieldBy(uid, 'character_xp', exp, function(err) {
		callback(err, exp);
	});
}

function rewardPoints(uid, characterData, monster, callback) {
	var max_reward = parseInt(config.get('battle_base_reward_max'), 10),
		min_reward = parseInt(config.get('battle_base_reward_min'), 10);

	var reward = Math.floor(Math.random() * (max_reward - min_reward)) + min_reward;

	if ((monster.monster_level - characterData.character_level) > 1) {
		reward = Math.floor((monster.monster_level - characterData.character_level) * config.get('battle_base_reward_modifier') / 100 );
	}

	character.incrementPoints(uid, reward, function(err) {
		callback(err, reward);
	});
}

function rewardSP(uid, characterData, monster, callback) {
	character.incrementCharacterFieldBy(uid, 'character_sp', monster.monster_base_sp, function(err) {
		callback(err, monster.monster_base_sp);
	});
}

module.exports = conclusion;