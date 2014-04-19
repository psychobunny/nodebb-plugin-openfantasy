"use strict";


var stores = {};

stores.init = function(data) {
	stores.data = data;
	return stores;
};

module.exports = stores;