"use strict";

module.exports = function(app, middleware, controllers) {
	app.post('/api/openfantasy/character/create', controllers.character.create);
	app.post('/api/openfantasy/character/delete', controllers.character.delete);
};