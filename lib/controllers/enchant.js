"use strict";

var enchant = require('../enchant'),
	enchantController = {};

enchantController.render = function(req, res, callback) {
	enchant.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/enchant', data);
	});
};


module.exports = enchantController;