"use strict";

var character = require('./character'),
	skills = {
		library: {}
	};

skills.view = function(uid, callback) {
	var fieldsToRetrieve = [];

	for (var s in skills.data) {
		if (skills.data.hasOwnProperty(s)) {
			fieldsToRetrieve.push('character_skill_' + skills.data[s].skill_system_name);
			fieldsToRetrieve.push('character_skill_' + skills.data[s].skill_system_name + '_uses');
		}
	}

	character.getCharacterFields(uid, fieldsToRetrieve, function(err, data) {
		if (!data || data[fieldsToRetrieve[0]] === null) {
			return callback(true);
		}

		var skillsArr = [];

		for (var s in skills.data) {
			if (skills.data.hasOwnProperty(s)) {
				var skill = skills.data[s],
					systemName = skill.skill_system_name,
					skill_bar = Math.floor(data['character_skill_' + systemName + '_uses'] / skill.skill_req * 90),
					skill_bar_empty = 90 - skill_bar;

				skillsArr.push({
					skill_name: skill.skill_name,
					skill_desc: skill.skill_desc,
					skill_img: skill.skill_img,
					skill_level: data['character_skill_' + systemName],
					skill_min: data['character_skill_' + systemName + '_uses'],
					skill_max: skill.skill_req,
					skill_bar: skill_bar,
					skill_bar_empty: skill_bar_empty
				});
			}
		}

		callback(err, {skills: skillsArr});
	});
};

skills.init = function(data) {
	for (var s in data) {
		if (data.hasOwnProperty(s)) {
			skills.library[data[s].skill_id] = data[s];
		}
	}

	skills.data = data;
	return skills;
};

skills.getClassByID = function(class_id) {
	return skills.data[class_id];
};

module.exports = skills;
