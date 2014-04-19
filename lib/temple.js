"use strict";

var temple = {};

temple.render = function(req, res, callback) {
	var content = templates.prepare(OF.templates['temple.tpl']);

	if (req.user && req.user.uid) {
		Character.getCharacterFields(req.user.uid, ["character_id", "character_hp", "character_hp_max", "character_mp", "character_mp_max", "character_level"], function(err, data) {
			
			if (data.character_id) {
				data.heal_cost = Math.ceil(OF.data.config.temple_heal_cost * data.character_level);
				data.resurrect_cost = Math.ceil(OF.data.config.temple_resurrect_cost * data.character_level);

				content = content.parse(data);


				translator.translate(content, function(content) {
					callback({content: content});
				});
			} else {
				return res.redirect('/rpg/character');
			}
		});
	}
	else
	{
		return res.redirect('/login');
	}
};

module.exports = temple;