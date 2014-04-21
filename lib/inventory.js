"use strict";

var async = require('async'),
	db = require('./nodebb').db,
	character = require('./character'),
	items = require('./items'),
	inventory = {};

inventory.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		async.parallel({
			userItemIDs: function(next) {
				db.getSetMembers('of:character:' + uid + ':inventory', next);
			},
			equipmentUIIDs: function(next) {
				db.getObject('of:character:' + uid + ':equipment', next);
			}
		}, function(err, data) {
			var userItems = [],
				equipmentUIIDs = Object.getOwnPropertyNames(data.equipmentUIIDs || {}).map(function(uiid) {
					return data.equipmentUIIDs[uiid];
				});

			async.each(data.userItemIDs, function(userItemID, next) {
				items.getUserItem(userItemID, function(err, userItem) {
					userItem.equipped = (equipmentUIIDs.indexOf(userItemID) !== -1);
					userItems.push(userItem);
					next(err);
				});
			}, function(err) {
				callback(err, {items: userItems});
			});
		});
	});
};

inventory.getBattleItems = function(uid, callback) {
	var battleItems = {
		wieldable: [
			{
				item_id: 0, // might not need this
				user_item_id: 0,
				battle_description: "[[of:battle_no_weapon]]",
				item_power: 1
			}
		],
		castable: [],
		usable: []
	};

	db.getSetMembers('of:character:' + uid + ':inventory', function(err, userItemIDs) {
		async.each(userItemIDs, function(userItemID, next) {
			items.getUserItem(userItemID, function(err, userItem) {
				if (userItem.item_duration <= 0) {
					return next(err);
				}

				var verb = null;

				if (items.isUsable(userItem.item_id)) {
					battleItems.usable.push(userItem);
					verb = '[[of:items_uses]]';
				} else if (items.isCastable(userItem.item_id)) {
					battleItems.castable.push(userItem);
					verb = '[[of:items_charges]]';
				} else if (items.isWieldable(userItem.item_id)) {
					battleItems.wieldable.push(userItem);
					verb = '[[of:items_duration]]';
				}

				if (verb) {
					userItem.battle_description = userItem.item_name + ' (' + verb + ': ' + userItem.item_duration + ' / ' + userItem.item_duration_max + ')';
				}

				next(err);
			});
		}, function(err) {
			if (!battleItems.usable.length) {
				battleItems.usable.push({
					item_id: 0, // might not need this
					user_item_id: 0,
					battle_description: "[[of:battle_no_item]]"
				});
			}

			if (!battleItems.castable.length) {
				battleItems.castable.push({
					item_id: 0, // might not need this
					user_item_id: 0,
					battle_description: "[[of:battle_no_spell]]"
				});
			}

			callback(err, battleItems);
		});
	});
};

inventory.addItem = function(uid, userItemID, callback) {
	db.setAdd('of:character:' + uid + ':inventory', userItemID, callback);
};

inventory.deleteItem = function(uid, userItemID, callback) {
	// todo: make sure item isn't equipped!
	db.isSetMember('of:character:' + uid + ':inventory', userItemID, function(err, isMember) {
		if (!isMember) {
			return callback(true);
		}

		db.setRemove('of:character:' + uid + ':inventory', userItemID);

		items.deleteUserItem(userItemID, function(err) {
			callback(err, {status: 1, message: '[[of:shop_items_successful_deleted]]'});
		});
	});
};

module.exports = inventory;