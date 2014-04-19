"use strict";


var config = {
	data: {}
};

module.exports = function(data) {
	config.data = data;
	return config.data;
};