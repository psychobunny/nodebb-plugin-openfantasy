"use strict";


var elements = {
	data: {}
};


elements.getElementByID = function(element_id) {
	return elements.data[element_id];
};

module.exports = function(data) {
	for (var e in data) {
		if (data.hasOwnProperty(e)) {
			elements.data[data[e].element_id] = data[e];
		}
	}
};