"use strict";


var elements = {
	library: {}
};

elements.init = function(data) {
	for (var e in data) {
		if (data.hasOwnProperty(e)) {
			elements.library[data[e].element_id] = data[e];
		}
	}

	elements.data = data;
	return elements;
};

elements.getElementByID = function(element_id) {
	return elements.data[element_id];
};

module.exports = elements;