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

equipmentController.equip = function(req, res, callback) {
	equipment.equip(req.user.uid, req.body.equipment, function(err, data) {
		res.json(data);
	});
};


module.exports = equipmentController;