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
		console.log(fieldsToRetrieve, data);
		if (!data) {
			return callback(true, {});
		}

		var skillsObj = {};

		for (var s in skills.data) {
			if (skills.data.hasOwnProperty(s)) {
				var systemName = skills.data[s].skill_system_name;
				
				skillsObj[systemName] = data['character_skill_' + systemName];
				skillsObj[systemName + '_min'] = data['character_skill_' + systemName + '_uses'];
				skillsObj[systemName + '_max'] = skills.data[s].skill_req;
				skillsObj[systemName + '_img'] = skills.data[s].skill_img;
				skillsObj[systemName + '_desc'] = skills.data[s].skill_desc;
				skillsObj[systemName + '_bar'] = Math.floor(skillsObj[systemName + '_min'] / skillsObj[systemName + '_max'] * 90);
				skillsObj[systemName + '_bar_empty'] = 90 - skillsObj[systemName + '_bar'];
			}
		}

		callback(err, skillsObj);
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
