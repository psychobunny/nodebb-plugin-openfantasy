"use strict";

var db = require('./nodebb').db;

var items = {
	library: {
		items: {},
		types: {},
		qualities: {}
	}
};

items.init = function(itemData, typeData, qualityData) {
	for (var i in itemData) {
		if (itemData.hasOwnProperty(i)) {
			items.library.items[itemData[i].item_id] = itemData[i];
		}
	}

	for (var t in typeData) {
		if (typeData.hasOwnProperty(t)) {
			items.library.types[typeData[t].item_type_id] = typeData[t];
		}
	}

	for (var q in qualityData) {
		if (qualityData.hasOwnProperty(q)) {
			items.library.qualities[qualityData[q].item_quality_id] = qualityData[q];
		}
	}

	items.data = itemData;
	return items;
};

items.createUserItem = function(uid, itemID, callback) {
	db.incrObjectField('of:global', 'nextUserItemID', function(err, nuiid) {
		var item = {
			item_id: itemID,
			user_item_id: nuiid,
			item_bought_timestamp: (new Date()).getTime(),
			item_duration: items.library.items[itemID].item_duration
		};

		db.setObject('of:userItems:' + nuiid, item);
		callback(err, nuiid);
	});
};

items.getUserItem = function(userItemID, callback) {
	db.getObject('of:userItems:' + userItemID, function(err, userItem) {
		if (!userItem) {
			return callback(err, {item_id: 0, user_item_id: userItemID});
		}

		var item = items.library.items[userItem.item_id];
		
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

items.getPrice = function(itemID) {
	return parseInt(items.library.items[itemID].item_price, 10);
};

items.getName = function(itemID) {
	return items.library.items[itemID].item_name;
};

items.isEquippable = function(itemID) {
	var type = items.library.items[itemID].item_type_use;
	return items.library.types[type].equippable;
};

items.isCastable = function(itemID) {
	var type = items.library.items[itemID].item_type_use;
	return items.library.types[type].castable;
};

items.isUsable = function(itemID) {
	var type = items.library.items[itemID].item_type_use;
	return items.library.types[type].usable;
};

items.isWieldable= function(itemID) {
	var type = items.library.items[itemID].item_type_use;
	return items.library.types[type].wieldable;
};

items.getItemTypes = function() {
	return items.library.types;
};

module.exports = items;