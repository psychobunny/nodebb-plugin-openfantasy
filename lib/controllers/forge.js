"use strict";

var forge = require('../forge'),
	forgeController = {};

forgeController.render = function(req, res, callback) {
	forge.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/forge', data);
	});
};


module.exports = forgeController;