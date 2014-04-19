"use strict";

var character = require('./character'),
	inventory = require('./inventory'),
	items = require('./items'),
	equipment = {};

equipment.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		var itemTypes = items.getItemTypes();

		inventory.view(uid, function(err, userItems) {
			for (var u in userItems.items) {
				if (userItems.items.hasOwnProperty(u)) {
					var userItem = userItems.items[u],
						itemID = userItem.item_id;

					if (!items.isEquippable(itemID)) {
						continue;
					}

					itemTypes[userItem.item_type_use].items = itemTypes.items || [];
					itemTypes[userItem.item_type_use].items.push(userItem);
				}
			}

			var equipment = [];

			for (var type in itemTypes) {
				if (itemTypes.hasOwnProperty(type)) {
					if (!itemTypes[type].equippable) {
						continue;
					}

					var itemsOfType = itemTypes[type].items || [];
					itemsOfType.unshift({
						"user_item_id": 0,
						"item_name": "[[of:equip_none]]"
					});

					equipment.push({
						name: itemTypes[type].item_type_lang,
						items: itemsOfType
					});
				}
			}

			callback(err, {
				equipment_types: equipment,
				owner: true
			});
		});
	});
};

module.exports = equipment;