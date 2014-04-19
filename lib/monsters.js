"use strict";


var monsters = {};

monsters.init = function() {
	var monsters = OF.data.monsters,
		dictionary = {};

	for (var m in monsters) {
		if (monsters.hasOwnProperty(m)) {
			dictionary[monsters[m].monster_id] = monsters[m];
		}
	}

	OF.data.monsters = dictionary;
};

monsters.getMonstersByLevel = function(character_level, callback) {
	var monsters = OF.data.monsters,
		eligible = [];

	for (var m in monsters) {
		if (monsters[m].monster_level <= character_level) {
			eligible.push(monsters[m]);
		}
	}

	return eligible;
};

monsters.getMonsterByID = function(monster_id) {
	return OF.data.monsters[monster_id];
};

module.exports = monsters;