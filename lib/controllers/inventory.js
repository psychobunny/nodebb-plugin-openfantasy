"use strict";

var inventory = require('../inventory'),
	inventoryController = {};

inventoryController.render = function(req, res, callback) {
	inventory.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/inventory', data);
	});
};


module.exports = inventoryController;