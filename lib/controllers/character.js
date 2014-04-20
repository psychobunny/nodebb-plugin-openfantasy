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
		}, function(err) {
			res.json({});
		});
	} else {
		return res.redirect('/login');
	}
};

characterController.delete = function(req, res, callback) {
	if (req.user && req.user.uid) {
		character.delete(req.user.uid, callback);
	}
};

characterController.render = function(req, res, callback) {
	if (req.user && req.user.uid) {
		character.view(req.user.uid, function(err, data) {
			res.render('rpg/character', data);
		});
	} else {
		return res.redirect('/login');
	}
};

module.exports = characterController;