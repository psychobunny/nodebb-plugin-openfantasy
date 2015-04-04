"use strict";

var	fs = require('fs'),
	async = require('async'),
	path = require('path'),
	nconf = require('nconf'),
	winston = require('winston'),
	data = require('./data/data'),
	meta = module.parent.require('./meta'),
	plugins = module.parent.require('./plugins'),
	templates = module.parent.require('templates.js'),
	translator = module.parent.require('../public/src/modules/translator');




var OF = {
	templates: {},
	data: data
};

var constants = Object.freeze({
	"image_path": nconf.get('url') + "/plugins/nodebb-plugin-openfantasy/static/images/"
});

function initialize(app, middleware, controllers) {
	require('./lib/nodebb');
	
	require('./lib/middleware')(app, middleware);
	require('./lib/controllers')(controllers);
	require('./lib/routes/main')(app, middleware, controllers);

	setupTranslations(app);
	data = normalizeImagePaths(data);

	require('./lib/alignments').init(data.alignments);
	require('./lib/classes').init(data.classes);
	require('./lib/config').init(data.config);
	require('./lib/elements').init(data.elements);
	require('./lib/items').init(data.shops_items, data.shops_items_type, data.shops_items_quality);
	require('./lib/monsters').init(data.battle_monsters);
	require('./lib/races').init(data.races);
	require('./lib/skills').init(data.skills);
	require('./lib/stores').init(data.stores);
}

function setupTranslations(app) {
	// todo: need to add all translations in directory
	var lang = 'en_GB';
	translator.addTranslation(lang, 'of', require('./static/language/' + lang + '/openfantasy.json'));

	app.get('/language/' + lang + '/of.json', function(req, res, next) {
		res.send(200, require('./static/language/' + lang + '/openfantasy.json'));
	});
}

function normalizeImagePaths(data) {
	for (var d in data) {
		if (data.hasOwnProperty(d)) {
			if (data[d].constructor === Array || data[d] instanceof Object) {
				data[d] = normalizeImagePaths(data[d]);
			} else {
				if (typeof data[d] === 'string') {
					var extension = data[d].substr(data[d].length - 4).toLowerCase();
					if (extension === '.png' || extension === '.jpg' || extension === '.jpeg' || extension === '.gif') {
						data[d] = constants.image_path + data[d];
					}
				}
			}
		}
	}

	return data;
}

OF.init = function(params, callback) {
	var router = params.router,
		middleware = params.middleware,
		controllers = params.controllers;


	plugins.isActive('nodebb-plugin-cash', function(err, isActive) {
		if (!isActive) {
			return winston.error('[openfantasy] Cash MOD not installed, OpenFantasy has been deactivated');
		}

		templates.setGlobal('l_points', meta.config['cash:currency_name'] ? meta.config['cash:currency_name'] : 'points');

		initialize(router, middleware, controllers);
		callback();
	});

	router.get('/admin/openfantasy/home', middleware.admin.buildHeader, renderAdmin);
	router.get('/api/admin/openfantasy/home', renderAdmin);
};

OF.addNavigation = function(menu, callback) {
	menu.push({
		"route": "/rpg/character",
		"title": "RPG",
		"enabled": true,
		"iconClass": "fa-compass",
		"text": "\\[\\[openfantasy:rpg\\]\\]",
		"properties": {
			"loggedIn": true
		}
	});

	callback (null, menu);
};

OF.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/openfantasy/home',
		icon: 'fa-compass',
		name: 'OpenFantasy'
	});

	callback(null, header);
};

function renderAdmin(req, res, next) {
	res.render('admin/openfantasy/home', {});
}

module.exports = OF;
