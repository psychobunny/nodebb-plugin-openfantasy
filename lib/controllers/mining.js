"use strict";

var mining = require('../mining'),
	miningController = {};

miningController.render = function(req, res, callback) {
	mining.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/mining', data);
	});
};


module.exports = miningController;