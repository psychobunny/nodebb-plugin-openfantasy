"use strict";

var async = require('async'),
	calculations = require('../helpers/calculations'),
	character = require('../character'),
	config = require('../config'),
	equipment = require('../equipment'),
	monsters = require('../monsters');



module.exports = function(uid, callback) {
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
};