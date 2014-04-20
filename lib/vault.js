"use strict";

var character = require('./character'),
	vault = {};

vault.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		callback(err, {
			account: false,
			accounts: 0,
			total_deposit: 0
		});
	});
};

module.exports = vault;