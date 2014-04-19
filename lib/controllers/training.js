"use strict";

var training = require('../training'),
	trainingController = {};

trainingController.render = function(req, res, callback) {
	training.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/training', data);
	});
};


module.exports = trainingController;