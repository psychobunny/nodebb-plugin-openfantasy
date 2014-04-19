"use strict";


var races = {
	data: {}
};

races.init = function(races) {
	for (var r in races) {
		if (races.hasOwnProperty(r)) {
			races.data[races[r].element_id] = races[r];
		}
	}
};

races.getRaceByID = function(element_id) {
	return races.data[element_id];
};

module.exports = function(data) {
	races.init(data);
	return races;
};