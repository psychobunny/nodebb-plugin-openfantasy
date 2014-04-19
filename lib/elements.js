"use strict";


var elements = {};

elements.init = function() {
	var elements = OF.data.elements,
		dictionary = {};

	for (var e in elements) {
		if (elements.hasOwnProperty(e)) {
			dictionary[elements[e].element_id] = elements[e];
		}
	}

	OF.data.elements = dictionary;
};

elements.getElementByID = function(element_id) {
	return OF.data.elements[element_id];
};

module.exports = elements;