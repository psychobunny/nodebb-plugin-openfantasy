"use strict";

var shops = require('../shops'),
	shopsController = {};

shopsController.render = function(req, res, callback) {
	shops.view(req.user.uid, req.params.mode, req.params.mid, function(err, data) {
		if (err) {
			return res.redirect('/rpg/character');
		}

		res.render('rpg/shops', data);
	});
};


module.exports = shopsController;