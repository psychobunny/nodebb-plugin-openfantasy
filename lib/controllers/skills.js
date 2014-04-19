"use strict";

var skills = require('../skills'),
	skillsController = {};

skillsController.render = function(req, res, callback) {
	skills.view(req.user.uid, function(err, data) {
		if (err) {
			res.redirect('/rpg/character');
		}
		
		res.render('rpg/skills', data);
	});
};


module.exports = skillsController;