"use strict";

var battle = require('../battle'),
	battleController = {};

battleController.render = function(req, res, callback) {
	battle.view(req.user.uid, function(err, data) {
		if (err) {
			return require.main.require('./src/controllers/helpers').redirect(res, '/rpg/character');
		}
		
		res.render('rpg/battle', data);
	});
};

battleController.initialize = function(req, res, callback) {
	battle.initialize(req.user.uid, function(err, data) {
		res.json(data);
	});
};

battleController.move = function(req, res, callback) {
	battle.move(req.user.uid, req.body.move, req.body.mid, function(err, data) {
		res.json(data);
	});
};

module.exports = battleController;