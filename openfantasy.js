"use strict";

var	fs = require('fs'),
	async = require('async'),
	path = require('path'),
	nconf = require('nconf'),
	data = require('./data/data.js'),
	templates = module.parent.require('../public/src/templates.js'),
	translator = module.parent.require('../public/src/translator.js');




var OF = {
	templates: {},
	data: data
};

var constants = Object.freeze({
	"image_path": nconf.get('url') + "plugins/nodebb-plugin-openfantasy/images/"
});

OF.init = function(app, middleware, controllers) {
	//todo: check here if cash mod is activated.
	require('./lib/nodebb');

	require('./lib/controllers')(controllers);
	require('./lib/routes/main')(app, middleware, controllers);

	require('./lib/alignments')(data);
	require('./lib/classes')(data);
	require('./lib/elements')(data);
	require('./lib/monsters')(data);
	require('./lib/races')(data);

	require('./lib/config')(data);


	function setupTranslations() {
		//var lang = translator.getLanguage(); // this line started crashing :/
		var lang = 'en';
		translator.addTranslation('of', require('./static/language/' + lang + '/openfantasy.json'));
	}

	function normalizeImagePaths(data) {
		for (var d in data) {
			if (data.hasOwnProperty(d)) {
				if (data[d].constructor === Array || data[d] instanceof Object) {
					data[d] = normalizeImagePaths(data[d]);
				} else {
					var extension = data[d].substr(data[d].length - 4).toLowerCase();
					if (extension === '.png' || extension === '.jpg' || extension === '.jpeg' || extension === '.gif') {
						data[d] = constants.image_path + data[d];
					}
				}
			}
		}

		return data;
	}
	
	//setupTranslations();
	OF.data = normalizeImagePaths(OF.data);
};

OF.addNavigation = function(custom_header, callback) {
	custom_header.navigation.push({
			"class": "",
			"route": "/rpg/character",
			"text": "RPG"
		});

	callback(null, custom_header);
};

OF.addRoute = function(custom_routes, callback) {
	var templatesToLoad = ["shops.tpl", "temple.tpl", "character.tpl", "header.tpl", "footer.tpl", "battle.tpl", "equipment.tpl", "inventory.tpl", "skills.tpl", "courthouse.tpl", "vault.tpl", "stock.tpl", "forge.tpl", "mining.tpl", "enchant.tpl", "warehouse.tpl", "training.tpl"];

	function loadTemplate(template, next) {
		fs.readFile(path.resolve(__dirname, './static/templates/' + template), function (err, data) {
			OF.templates[template] = data.toString();
			next(err);
		});
	}

	function buildHeader(data) {
		data.content = OF.templates["header.tpl"] + data.content + OF.templates["footer.tpl"];
		return data;
	}

	async.each(templatesToLoad, loadTemplate, function(err) {
		if (err) {
			throw new Error("Error loading templates: " + err);
		}

		translator.translate(OF.templates['header.tpl'], function(translated) {
			OF.templates['header.tpl'] = translated;
		});
		
		custom_routes.routes = custom_routes.routes.concat(
			[
				{
					"route": "/rpg",
					"method": "get",
					"options": function(req, res, callback) {
						res.redirect("/rpg/character");
					}
				}
			],
			[
				{
					"route": "/rpg/character",
					"method": "get",
					"options": function(req, res, callback) {
						Character.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/temple",
					"method": "get",
					"options": function(req, res, callback) {
						Temple.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/shops/:mode?/:mid?",
					"method": "get",
					"options": function(req, res, callback) {
						Shops.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/battle",
					"method": "get",
					"options": function(req, res, callback) {
						Battle.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/equipment",
					"method": "get",
					"options": function(req, res, callback) {
						Equipment.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/inventory",
					"method": "get",
					"options": function(req, res, callback) {
						Inventory.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/skills",
					"method": "get",
					"options": function(req, res, callback) {
						Skills.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/courthouse",
					"method": "get",
					"options": function(req, res, callback) {
						Courthouse.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/vault",
					"method": "get",
					"options": function(req, res, callback) {
						Vault.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/stock",
					"method": "get",
					"options": function(req, res, callback) {
						StockMarket.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/forge",
					"method": "get",
					"options": function(req, res, callback) {
						Forge.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/mining",
					"method": "get",
					"options": function(req, res, callback) {
						Mining.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/enchant",
					"method": "get",
					"options": function(req, res, callback) {
						Enchant.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/warehouse",
					"method": "get",
					"options": function(req, res, callback) {
						Warehouse.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			],
			[
				{
					"route": "/rpg/training",
					"method": "get",
					"options": function(req, res, callback) {
						Training.render(req, res, function(data) {
							callback(buildHeader(data));
						});
					}
				}
			]
		);

		custom_routes.api = custom_routes.api.concat(
			[
				{
					"method": "post",
					"route": "/openfantasy/character/create",
					"callback": Character.create
				},
				{
					"method": "post",
					"route": "/openfantasy/character/delete",
					"callback": Character.delete
				}
			]
		);

		callback(err, custom_routes);
	});
};

module.exports = OF;
