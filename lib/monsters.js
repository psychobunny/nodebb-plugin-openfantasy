"use strict";


var monsters = {
	library: {}
};

monsters.init = function(data) {
	for (var m in data) {
		if (data.hasOwnProperty(m)) {
			monsters.library[data[m].monster_id] = data[m];
		}
	}

	monsters.data = data;
	return monsters;
};

monsters.getMonstersByLevel = function(character_level) {
	var monsterList = monsters.data,
		eligible = [];
		
	for (var m in monsterList) {
		if (monsterList[m].monster_level <= character_level) {
			eligible.push(monsterList[m]);
		}
	}

	return eligible;
};

monsters.getMonsterByID = function(monster_id) {
	return monsters.library[monster_id];
};

module.exports = monsters;