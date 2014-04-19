"use strict";

var enchant = {};

enchant.render = function(req, res, callback) {
	var content = templates.prepare(OF.templates['enchant.tpl']);

	if (req.user && req.user.uid) {
		Character.getCharacterField(req.user.uid, 'character_id', function(err, data) {
			if (data) {
				content = content.parse({});

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


module.exports = enchant;