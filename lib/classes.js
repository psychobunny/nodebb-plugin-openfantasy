"use strict";


var classes = {};

classes.init = function() {
	var classes = OF.data.classes,
		dictionary = {};

	for (var c in classes) {
		if (classes.hasOwnProperty(c)) {
			dictionary[classes[c].class_id] = classes[c];
		}
	}

	OF.data.classes = dictionary;
};

classes.getClassByID = function(class_id) {
	return OF.data.classes[class_id];
};

module.exports = classes;