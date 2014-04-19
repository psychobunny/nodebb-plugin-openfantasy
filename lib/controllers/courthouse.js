"use strict";

var courthouse = require('../courthouse'),
	courthouseController = {};

courthouseController.render = function(req, res, callback) {
	courthouse.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/courthouse', data);
	});
};


module.exports = courthouseController;