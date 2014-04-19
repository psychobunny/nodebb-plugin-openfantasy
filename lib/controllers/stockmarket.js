"use strict";

var stockmarket = require('../stockmarket'),
	stockmarketController = {};

stockmarketController.render = function(req, res, callback) {
	stockmarket.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/stockmarket', data);
	});
};


module.exports = stockmarketController;