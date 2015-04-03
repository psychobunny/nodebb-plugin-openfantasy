"use strict";

var stockmarket = require('../stockmarket'),
	stockmarketController = {};

stockmarketController.render = function(req, res, callback) {
	stockmarket.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/stock', data);
	});
};


module.exports = stockmarketController;