"use strict";

var inventory = require('../inventory'),
	inventoryController = {};

inventoryController.render = function(req, res, callback) {
	inventory.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
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