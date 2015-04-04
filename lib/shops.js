"use strict";

var async = require('async'),
	character = require('./character'),
	inventory = require('./inventory'),
	items = require('./items'),
	stores = require('./stores'),
	shops = {};

shops.view = function(uid, mode, mid, callback) {
	character.getCharacterFields(uid, ['character_id', 'battle_id'], function(err, data) {
		if (!data.character_id) {
			return callback(true);
		}

		if (data.battle_id) {
			return callback(err, {
				in_battle: true
			});
		}

		require('./nodebb').user.getUserField(uid, 'currency', function(err, currency) {
			if (!mode) {
				var store_data = stores.data;

				for (var s in store_data) {
					if (store_data.hasOwnProperty(s)) {
						var store = store_data[s];

						if (store.sale && store.store_status) {
							store.store_status = "[[of:store_sale]]";
						} else {
							store.store_status = store.store_status ? "[[of:store_open]]" : "[[of:store_closed]]";
						}
					}
				}

				callback(err, {
					view_store_list: true,
					store: store_data,
					character_points: currency || 0
				});
			} else if (mode === 'store') {
				var itemsData = items.data, shopsItems = [];

				for (var i in itemsData) {
					if (itemsData.hasOwnProperty(i)) {
						var item = itemsData[i];
						if (item.item_store_id === mid) {
							shopsItems.push(item);
						}
					}
				}

				callback(err, {
					view_store: true,
					items: shopsItems,
					character_points: currency || 0
				});
			}
		});
	});
};

shops.buy = function(uid, itemID, callback) {
	character.getCharacterFields(uid, ['character_id'], function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		character.getPoints(uid, function(err, points) {
			var price = items.getPrice(itemID);
			
			if (points >= price) {
				character.decrementPoints(uid, price);
				items.createUserItem(uid, itemID, function(err, userItemID) {
					inventory.addItem(uid, userItemID);
				});

				callback(err, {status: 1, message: '[[of:buy_item_success, ' + price + ', {l_points}]]'});
			} else {
				callback(err, {status: 0, message: '[[of:lack_points]]'});
			}
		});
	});
};

module.exports = shops;