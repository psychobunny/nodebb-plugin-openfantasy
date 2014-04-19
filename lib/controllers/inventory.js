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

inventoryController.delete = function(req, res, callback) {
	inventory.deleteItem(req.user.uid, req.body.userItemID, function(err, data) {
		res.json(data);
	});
};

module.exports = inventoryController;