"use strict";

var mining = require('../mining'),
	miningController = {};

miningController.render = function(req, res, callback) {
	mining.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/mining', data);
	});
};


module.exports = miningController;