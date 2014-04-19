"use strict";


var items = {
	library: {}
};

items.init = function(data) {
	for (var i in data) {
		if (data.hasOwnProperty(i)) {
			items.library[data[i].item_id] = data[i];
		}
	}

	items.data = data;
	return items;
};

items.getPrice = function(itemID, callback) {
	return parseInt(items.library[itemID].item_price, 10);
};

module.exports = items;