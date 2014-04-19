"use strict";

var equipment = require('../equipment'),
	equipmentController = {};

equipmentController.render = function(req, res, callback) {
	equipment.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/equipment', data);
	});
};


module.exports = equipmentController;