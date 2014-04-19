"use strict";

module.exports = function(controllers) {
	controllers.character = require('./character');
	controllers.temple = require('./temple');
	controllers.shops = require('./shops');
	controllers.battle = require('./battle');
	controllers.equipment = require('./equipment');
	controllers.inventory = require('./inventory');
	controllers.skills = require('./skills');
	controllers.courthouse = require('./courthouse');
	controllers.vault = require('./vault');
	controllers.stockmarket = require('./stockmarket');
	controllers.forge = require('./forge');
	controllers.mining = require('./mining');
	controllers.enchant = require('./enchant');
	controllers.warehouse = require('./warehouse');
	controllers.training = require('./training');
};