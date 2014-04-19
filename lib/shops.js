"use strict";

var async = require('async'),
	character = require('./character'),
	shopsItems = require('./items'),
	stores = require('./stores'),
	shops = {};

shops.view = function(uid, mode, mid, callback) {
	character.getCharacterField(uid	, 'character_id', function(err, data) {
		if (!data) {
			return callback(true);
		}

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
				store: store_data
			});
		} else if (mode === 'store') {
			var shops_items = shopsItems.data, items = [];

			for (var i in shops_items) {
				if (shops_items.hasOwnProperty(i)) {
					var item = shops_items[i];
					if (item.item_store_id === mid) {
						items.push(item);
					}
				}
			}

			callback(err, {
				view_store: true,
				items: items
			});
		}
	});
};

shops.buy = function(uid, itemID, callback) {
	console.log(uid, itemID);
	character.getCharacterFields(uid, ['character_id'], function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		character.getPoints(uid, function(err, points) {
			var price = shopsItems.getPrice(itemID);
			
			if (points >= price) {
				callback(err, {status: 1, message: '[[of:buy_item_success, ' + price + ', {l_points}]]'});
			} else {
				callback(err, {status: 0, message: '[[of:lack_points]]'});
			}
		});
	});
};

module.exports = shops;