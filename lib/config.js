"use strict";


var config = {};

config.init = function(data) {
	config.data = data;
	return config;
};

config.get = function(key) {
	return config.data[key];
};

module.exports = config;