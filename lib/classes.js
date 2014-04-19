"use strict";


var classes = {
	data: {}
};

classes.getClassByID = function(class_id) {
	return classes.data[class_id];
};

module.exports = function(data) {
	for (var c in data) {
		if (data.hasOwnProperty(c)) {
			classes.data[data[c].class_id] = data[c];
		}
	}
};