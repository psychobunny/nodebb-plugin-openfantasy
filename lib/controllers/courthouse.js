"use strict";

var courthouse = require('../courthouse'),
	courthouseController = {};

courthouseController.render = function(req, res, callback) {
	courthouse.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/courthouse', data);
	});
};


module.exports = courthouseController;