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
		var item = {
			item_id: itemID,
			user_item_id: nuiid,
			item_duration: items.library[itemID].item_duration
		};

		db.setObject('of:userItems:' + nuiid, item);
		callback(err, nuiid);
	});
};

items.getUserItem = function(userItemID, callback) {
	db.getObject('of:userItems:' + userItemID, function(err, userItem) {
		var item = items.library[userItem.item_id];
		
		for (var i in userItem) {
			if (userItem.hasOwnProperty(i)) {
				item[i] = userItem[i];
			}
		}

		callback(err, item);
	});
};

items.deleteUserItem = function(userItemID, callback) {
	db.delete('of:userItems:' + userItemID, callback);
};

items.getPrice = function(itemID, callback) {
	return parseInt(items.library[itemID].item_price, 10);
};

items.getName = function(itemID, callback) {
	return items.library[itemID].item_name;
};

module.exports = items;