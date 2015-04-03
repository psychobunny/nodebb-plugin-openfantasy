"use strict";

var temple = require('../temple'),
	templeController = {};

templeController.render = function(req, res, next) {
	temple.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/temple', data);
	});
};

module.exports = templeController;