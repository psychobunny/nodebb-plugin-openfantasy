"use strict";

var character = require('./character'),
	skills = {};

skills.view = function(uid, callback) {
	character.getCharacterFields(uid, ['character_skill_mining', 'character_skill_stone', 'character_skill_forge', 'character_skill_enchantment', 'character_skill_trading', 'character_skill_thief', 'character_skill_mining_uses', 'character_skill_stone_uses', 'character_skill_forge_uses', 'character_skill_enchantment_uses', 'character_skill_trading_uses', 'character_skill_thief_uses'], function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		callback(err, {
			mining: 'character_skill_mining',
			stone: 'character_skill_stone',
			forge: 'character_skill_forge',
			enchantment: 'character_skill_enchantment',
			trading: 'character_skill_trading',
			thief: 'character_skill_thief',
			mining_min: 'character_skill_mining_uses',
			stone_min: 'character_skill_stone_uses',
			forge_min: 'character_skill_forge_uses',
			enchantment_min: 'character_skill_enchantment_uses',
			trading_min: 'character_skill_trading_uses',
			thief_min: 'character_skill_thief_uses'
		});
	});
};

module.exports = skills;