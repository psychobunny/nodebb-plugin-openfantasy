"use strict";


var monsters = {
	data: {},
	original: null // re-look into this.
};

monsters.getMonstersByLevel = function(character_level, callback) {
	var monsters = monsters.original,
		eligible = [];

	for (var m in monsters) {
		if (monsters[m].monster_level <= character_level) {
			eligible.push(monsters[m]);
		}
	}

	return eligible;
};

monsters.getMonsterByID = function(monster_id) {
	return monsters.data[monster_id];
};

module.exports = function(data) {
	for (var m in data) {
		if (data.hasOwnProperty(m)) {
			monsters.data[data[m].monster_id] = data[m];
		}
	}
};