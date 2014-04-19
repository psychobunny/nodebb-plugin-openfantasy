"use strict";


var elements = {
	data: {}
};

elements.init = function(elements) {
	for (var e in elements) {
		if (elements.hasOwnProperty(e)) {
			elements.data[elements[e].element_id] = elements[e];
		}
	}
};

elements.getElementByID = function(element_id) {
	return elements.data[element_id];
};

module.exports = function(data) {
	elements.init(data);
	return elements;
};