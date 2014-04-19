"use strict";


var races = {
	library: {},
	data: {}
};

races.getRaceByID = function(race_id) {
	return races.data[race_id];
};

module.exports = function(data) {
	for (var r in data) {
		if (data.hasOwnProperty(r)) {
			races.library[data[r].race_id] = data[r];
		}
	}

	races.data = data;

	return races;
};