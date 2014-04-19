"use strict";

var battle = require('../battle'),
	battleController = {};

battleController.render = function(req, res, callback) {
	battle.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/battle', data);
	});
};


module.exports = battleController;