"use strict";

var vault = require('../vault'),
	vaultController = {};

vaultController.render = function(req, res, callback) {
	vault.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/vault', data);
	});
};


module.exports = vaultController;