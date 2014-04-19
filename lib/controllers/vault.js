"use strict";

var vault = require('../vault'),
	vaultController = {};

vaultController.render = function(req, res, callback) {
	vault.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/vault', data);
	});
};


module.exports = vaultController;