"use strict";


var classes = {
	data: {}
};

classes.init = function(classes) {
	for (var c in classes) {
		if (classes.hasOwnProperty(c)) {
			classes.data[classes[c].class_id] = classes[c];
		}
	}
};

classes.getClassByID = function(class_id) {
	return classes.data[class_id];
};

module.exports = function(data) {
	classes.init(data);
	return classes;
};