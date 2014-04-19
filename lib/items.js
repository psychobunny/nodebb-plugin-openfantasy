"use strict";

var db = require('./nodebb').db;

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

items.createUserItem = function(uid, itemID, callback) {
	db.incrObjectField('of:global', 'nextUserItemID', function(err, nuiid) {
		var item = items.library[itemID];
		item.userItemID = nuiid;

		callback(err, nuiid);
	});
};

items.getPrice = function(itemID, callback) {
	return parseInt(items.library[itemID].item_price, 10);
};

items.getName = function(itemID, callback) {
	return items.library[itemID].item_name;
};

module.exports = items;