"use strict";

var warehouse = require('../warehouse'),
	warehouseController = {};

warehouseController.render = function(req, res, callback) {
	warehouse.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/warehouse', data);
	});
};


module.exports = warehouseController;