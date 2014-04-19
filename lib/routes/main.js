"use strict";


module.exports = function(app, middleware, controllers) {
	require('./api')(app, middleware, controllers);

	app.get('/rpg/character', middleware.buildHeader, middleware.openfantasy.buildHeader, controllers.character.render);
	app.get('/api/rpg/character', controllers.character.render);

	app.get('/rpg/temple', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.temple.render);
	app.get('/api/rpg/temple', middleware.authenticate, controllers.temple.render);
/*
	app.get('/rpg/shops/:mode?/:mid?', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.shops.render);
	app.get('/api/rpg/shops/: middleware.authenticate,mode?/:mid?', controllers.shops.render);

	app.get('/rpg/battle', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.battle.render);
	app.get('/api/rpg/battle', middleware.authenticate, controllers.battle.render);

	app.get('/rpg/equipment', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.equipment.render);
	app.get('/api/rpg/equipment', middleware.authenticate, controllers.equipment.render);

	app.get('/rpg/inventory', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.inventory.render);
	app.get('/api/rpg/inventory', middleware.authenticate, controllers.inventory.render);

	app.get('/rpg/skills', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.skills.render);
	app.get('/api/rpg/skills', middleware.authenticate, controllers.skills.render);

	app.get('/rpg/courthouse', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.courthouse.render);
	app.get('/api/rpg/courthouse', middleware.authenticate, controllers.courthouse.render);

	app.get('/rpg/vault', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.vault.render);
	app.get('/api/rpg/vault', middleware.authenticate, controllers.vault.render);

	app.get('/rpg/stock', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.stockmarket.render);
	app.get('/api/rpg/stock', middleware.authenticate, controllers.stockmarket.render);

	app.get('/rpg/forge', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.forge.render);
	app.get('/api/rpg/forge', middleware.authenticate, controllers.forge.render);

	app.get('/rpg/mining', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.mining.render);
	app.get('/api/rpg/mining', middleware.authenticate, controllers.mining.render);

	app.get('/rpg/enchant', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.enchant.render);
	app.get('/api/rpg/enchant', middleware.authenticate, controllers.enchant.render);

	app.get('/rpg/warehouse', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.warehouse.render);
	app.get('/api/rpg/warehouse', middleware.authenticate, controllers.warehouse.render);

	app.get('/rpg/training', middleware.buildHeader, middleware.openfantasy.buildHeader, middleware.authenticate, controllers.training.render);
	app.get('/api/rpg/training', middleware.authenticate, controllers.training.render);
*/
};