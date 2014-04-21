"use strict";

var character = require('./character'),
	inventory = require('./inventory'),
	items = require('./items'),
	db = require('./nodebb').db,
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
						"item_name": "[[of:equip_none]]",
						"equipped": !itemsOfType.length ? true : false
					});

					equipment.push({
						item_type_name: itemTypes[type].item_type_lang,
						item_type_id: itemTypes[type].item_type_id,
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

equipment.equip = function(uid, equipment, callback) {
	var items = {};

	for(var e in equipment) {
		if (equipment.hasOwnProperty(e)) {
			items[equipment[e].name] = equipment[e].value;
		}
	}

	db.setObject('of:character:' + uid + ':equipment', items, function(err) {
		callback(err, {status: 1, message: '[[of:equip_done]]'});
	});
};

equipment.getEquippedItems = function(uid, callback) {
	equipment.view(uid, function(err, equipment) {
		var types = equipment.equipment_types;


		for (var t in types) {
			if (types.hasOwnProperty(t)) {
				var items = types[t].items;

				for (var i in items) {
					if (items.hasOwnProperty(i)) {
						if (items[i].equipped) {
							types[t].equipped = items[i];
							break;
						}
					}
				}

				delete types[t].items;
			}
		}

		callback(err, types);
	});
};

module.exports = equipment;