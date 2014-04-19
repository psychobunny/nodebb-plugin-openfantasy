"use strict";


var classes = {
	library: {}
};

classes.init = function(data) {
	for (var c in data) {
		if (data.hasOwnProperty(c)) {
			classes.library[data[c].class_id] = data[c];
		}
	}

	classes.data = data;
	return classes;
};

classes.getClassByID = function(class_id) {
	return classes.data[class_id];
};

module.exports = classes;