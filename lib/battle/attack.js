"use strict";

var calculations = require('../helpers/calculations'),
	elements = require('../elements'),
	battle = require('../battle');



module.exports = function(uid, events, userItem, battleData, character, monster, callback) {
	var weap = parseInt(userItem.item_id, 10),
		power = 1,
		quality = 0;

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
				message: '[[of:battle_attack_bare, ' + character.character_name + ', ' + damage + ', ' + monster.monster_name + ']]',
				type: 'character:attack'
			});
		} else {
			damage = 0;
			events.push({
				message: '[[of:battle_attack_bare_fail, ' + character.character_name + ', ' + monster.monster_name + ']]',
				type: 'character:attack:fail'
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
					message: '[[of:battle_attack_success, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ', ' + elemental.element_name + ', ' + damage + ']]',
					type: 'character:attack'
				});
			} else {
				userItem.item_name = 'Sword';  // todo: translator.translate this
				events.push({
					message: '[[of:battle_attack_success_norm, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ', ' + damage + ']]',
					type: 'character:attack'
				});
			}
		} else {
			damage = 0;
			userItem.item_name = 'Sword';  // todo: translator.translate this
			events.push({
				message: '[[of:battle_attack_failure, ' + character.character_name + ', ' + monster.monster_name + ', ' + userItem.item_name + ']]',
				type: 'character:attack'
			});
		}
	}

	battle.decrementBattleFieldBy(battleData.battle_id, 'battle_opponent_hp', damage, function(err, opponent_hp) {
		if (opponent_hp <= 0) {
			require('./conclusion').reward(uid, events, battleData, character, monster, function(err, events) {
				callback(err, {
					events: events,
					finished: 1
				});	
			});
		} else {
			callback(err, {
				events: events
			});
		}
	});
};