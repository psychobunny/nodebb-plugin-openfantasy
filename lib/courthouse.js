"use strict";

var character = require('./character'),
	courthouse = {};

courthouse.view = function(uid, callback) {
	character.getCharacterField(uid, 'character_id', function(err, data) {
		if (!data) {
			return callback(true, {});
		}

		callback(err, {});
	});
};

module.exports = courthouse;