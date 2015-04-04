"use strict";

var character = require('./character'),
	vault = {};

vault.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		require('./nodebb').user.getUserField(uid, 'currency', function(err, currency) {
			callback(err, {
				account: false,
				accounts: 0,
				total_deposit: 0,
				character_points: currency || 0
			});
		});
	});
};

module.exports = vault;