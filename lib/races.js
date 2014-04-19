"use strict";


var races = {
	data: {}
};

races.getRaceByID = function(element_id) {
	return races.data[element_id];
};

module.exports = function(data) {
	for (var r in data) {
		if (data.hasOwnProperty(r)) {
			races.data[data[r].element_id] = data[r];
		}
	}
};