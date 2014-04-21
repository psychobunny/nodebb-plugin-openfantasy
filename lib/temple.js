"use strict";

var character = require('./character'),
	config = require('./config'),
	temple = {};

temple.view = function(uid, callback) {
	character.getCharacterFields(uid, ['character_id', 'battle_id', 'character_hp', 'character_hp_max', 'character_mp', 'character_mp_max', 'character_level'], function(err, data) {
		if (!data.character_id) {
			return callback(true);
		}

		data.heal_cost = Math.ceil(config.data.temple_heal_cost * data.character_level);
		data.resurrect_cost = Math.ceil(config.data.temple_resurrect_cost * data.character_level);
		data.in_battle = !!data.battle_id;
		console.log(data);

		callback(err, data);
	});
};


module.exports = temple;