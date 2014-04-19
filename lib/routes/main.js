"use strict";


module.exports = function(app, middleware, controllers) {
	app.get('/rpg/character', middleware.buildHeader, controllers.character.render);
	app.get('/api/rpg/character', controllers.character.render);
/*
	app.get('/rpg/temple', middleware.buildHeader, controllers.temple.render);
	app.get('/api/rpg/temple', controllers.temple.render);

	app.get('/rpg/shops/:mode?/:mid?', middleware.buildHeader, controllers.shops.render);
	app.get('/api/rpg/shops/:mode?/:mid?', controllers.shops.render);

	app.get('/rpg/battle', middleware.buildHeader, controllers.battle.render);
	app.get('/api/rpg/battle', controllers.battle.render);

	app.get('/rpg/equipment', middleware.buildHeader, controllers.equipment.render);
	app.get('/api/rpg/equipment', controllers.equipment.render);

	app.get('/rpg/inventory', middleware.buildHeader, controllers.inventory.render);
	app.get('/api/rpg/inventory', controllers.inventory.render);

	app.get('/rpg/skills', middleware.buildHeader, controllers.skills.render);
	app.get('/api/rpg/skills', controllers.skills.render);

	app.get('/rpg/courthouse', middleware.buildHeader, controllers.courthouse.render);
	app.get('/api/rpg/courthouse', controllers.courthouse.render);

	app.get('/rpg/vault', middleware.buildHeader, controllers.vault.render);
	app.get('/api/rpg/vault', controllers.vault.render);

	app.get('/rpg/stock', middleware.buildHeader, controllers.stockmarket.render);
	app.get('/api/rpg/stock', controllers.stockmarket.render);

	app.get('/rpg/forge', middleware.buildHeader, controllers.forge.render);
	app.get('/api/rpg/forge', controllers.forge.render);

	app.get('/rpg/mining', middleware.buildHeader, controllers.mining.render);
	app.get('/api/rpg/mining', controllers.mining.render);

	app.get('/rpg/enchant', middleware.buildHeader, controllers.enchant.render);
	app.get('/api/rpg/enchant', controllers.enchant.render);

	app.get('/rpg/warehouse', middleware.buildHeader, controllers.warehouse.render);
	app.get('/api/rpg/warehouse', controllers.warehouse.render);

	app.get('/rpg/training', middleware.buildHeader, controllers.training.render);
	app.get('/api/rpg/training', controllers.training.render);
*/
};