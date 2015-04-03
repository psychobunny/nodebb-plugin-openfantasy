"use strict";

var enchant = require('../enchant'),
	enchantController = {};

enchantController.render = function(req, res, callback) {
	enchant.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/enchant', data);
	});
};


module.exports = enchantController;