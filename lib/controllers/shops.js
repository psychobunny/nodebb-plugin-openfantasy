"use strict";

var shops = require('../shops'),
	shopsController = {};

shopsController.render = function(req, res, next) {
	shops.view(req.user.uid, req.params.mode, req.params.mid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}

		res.render('rpg/shops', data);
	});
};

shopsController.buy = function(req, res, next) {
	shops.buy(req.user.uid, req.body.itemID, function(err, data) {
		res.json(data);
	});
};

module.exports = shopsController;