"use strict";

var db = require('./nodebb').db,
	character = require('./character'),
	inventory = {};

inventory.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		callback(err, {});
	});
};

inventory.addItem = function(uid, userItemID, callback) {
	db.listPrepend('of:character:' + uid + ':inventory', userItemID, callback);
};

module.exports = inventory;