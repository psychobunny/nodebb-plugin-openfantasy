"use strict";

var characterController = {},
	character = require('../character');


characterController.create = function(req, res, callback) {
	if (req.user && req.user.uid) {
		character.create(req.user.uid, {
			character_name: req.body.character_name,
			character_desc: req.body.character_desc,
			character_race: req.body.character_race,
			character_class: req.body.character_class,
			character_alignment: req.body.character_alignment,
			character_element: req.body.character_element
		}, callback);
	} else {
		return res.redirect('/login');
	}
};

module.exports = characterController;