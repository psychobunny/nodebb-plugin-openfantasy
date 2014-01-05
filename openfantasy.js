var	fs = require('fs'),
	async = require('async'),
	path = require('path'),
	nconf = require('nconf'),
	data = require('./data/data.js'),
	db = module.parent.require('../src/database.js'),
	templates = module.parent.require('../public/src/templates.js'),
	translator = module.parent.require('../public/src/translator.js');




var Character = {};
(function() {
	Character.create = function(uid, params) {
		db.setObject('of:character:' + uid, {
			character_id: uid,
			character_name: character_name || null,
			character_desc: character_desc || null,
			character_race: character_race || null,
			character_class: character_class || null,
			character_alignment: character_alignment || null,
			character_element: character_element || null,
			character_hp: character_hp || null,
			character_hp_max: character_hp_max || null,
			character_mp: character_mp || null,
			character_mp_max: character_mp_max || null,
			character_ac: character_ac || null,
			character_xp: character_xp || null,
			character_level: character_level || null,
			character_might: character_might || null,
			character_dexterity: character_dexterity || null,
			character_constitution: character_constitution || null,
			character_intelligence: character_intelligence || null,
			character_wisdom: character_wisdom || null,
			character_charisma: character_charisma || null,
			character_birth: character_birth || null,
			character_limit_update: character_limit_update || null,
			character_battle_limit: character_battle_limit || null,
			character_skill_limit: character_skill_limit || null,
			character_trading_limit: character_trading_limit || null,
			character_thief_limit: character_thief_limit || null,
			character_sp: character_sp || null,
			character_magic_attack: character_magic_attack || null,
			character_magic_resistance: character_magic_resistance || null,
			character_warehouse: character_warehouse || null,
			character_warehouse_update: character_warehouse_update || null,
			character_shop_update: character_shop_update || null,
			character_skill_mining: character_skill_mining || null,
			character_skill_stone: character_skill_stone || null,
			character_skill_forge: character_skill_forge || null,
			character_skill_enchantment: character_skill_enchantment || null,
			character_skill_trading: character_skill_trading || null,
			character_skill_thief: character_skill_thief || null,
			character_skill_mining_uses: character_skill_mining_uses || null,
			character_skill_stone_uses: character_skill_stone_uses || null,
			character_skill_forge_uses: character_skill_forge_uses || null,
			character_skill_enchantment_uses: character_skill_enchantment_uses || null,
			character_skill_trading_uses: character_skill_trading_uses || null,
			character_skill_thief_uses: character_skill_thief_uses || null,
			character_victories: character_victories || null,
			character_defeats: character_defeats || null,
			character_flees: character_flees || null,
			prefs_pvp_notif_pm: prefs_pvp_notif_pm || null,
			prefs_pvp_allow: prefs_pvp_allow || null,
			prefs_tax_pm_notify: prefs_tax_pm_notify || null,
			equip_armor: equip_armor || null,
			equip_buckler: equip_buckler || null,
			equip_helm: equip_helm || null,
			equip_gloves: equip_gloves || null,
			equip_amulet: equip_amulet || null,
			equip_ring: equip_ring || null,
			character_pref_give_pm: character_pref_give_pm || null,
			character_pref_seller_pm: character_pref_seller_pm || null,
			character_double_ko: character_double_ko || null,
			character_victories_pvp: character_victories_pvp || null,
			character_defeats_pvp: character_defeats_pvp || null,
			character_flees_pvp: character_flees_pvp || null,
			character_fp: character_fp || null
		});
	};

	Character.getCharacterField = function(uid, field, callback) {
		db.getObjectField('of:character:' + uid, field, callback);
	};

	Character.getCharacterFields = function(uid, fields, callback) {
		db.getObjectFields('of:character:' + uid, fields, callback);
	};


	Character.render = function(req, res, callback) {
		var content = templates.prepare(OF.templates['character.tpl']);

		if (req.user && req.user.uid) {
			Character.getCharacterFields(req.user.uid, ["character_hp", "character_hp_max", "character_mp", "character_mp_max", "character_level"], function(data) {
				if (data) {
					callback({
						content: content.parse(data)
					})
				} else {
					content = content.parse({
							"nocharacter": true,
							"races": OF.data.races,
							"classes": OF.data.classes,
							"elements": OF.data.elements,
							"alignments": OF.data.alignments
						});

					translator.translate(content, function(content) {
						callback({content: content});
					});
					
				}
			});
		}
		else
		{
			return res.redirect('/login');
		}
	}
}());

var Temple = {};
(function() {
	Temple.render = function(req, res, callback) {
		var content = templates.prepare(OF.templates['temple.tpl']).parse({});

		if (req.user && req.user.uid) {
			Character.getCharacterFields(req.user.uid, ["character_hp", "character_hp_max", "character_mp", "character_mp_max", "character_level"], function(data) {
				if (data) {
					callback({
						content: content
					});	
				} else {
					return res.redirect('/character');
				}
			});
		}
		else
		{
			return res.redirect('/login');
		}
	}
}());

var OF = {
	templates: {},
	data: data
};

var constants = Object.freeze({
	"image_path": nconf.get('url') + "plugins/nodebb-plugin-openfantasy/images/"
});

OF.init = function() {
	function setupTranslations() {
		var lang = translator.getLanguage();
		translator.addTranslation('of', require('./static/language/' + lang + '/openfantasy.json'));
	}

	function normalizeImagePaths(data) {
		for (var d in data) {
			if (data.hasOwnProperty(d)) {
				if (data[d].constructor == Array || data[d] instanceof Object) {
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
	
	setupTranslations();
	OF.data = normalizeImagePaths(OF.data);
}

OF.addNavigation = function(custom_header, callback) {
	custom_header.navigation = custom_header.navigation.concat(
		[
			{
				"class": "",
				"route": "/character",
				"text": "Character"
			},
			{
				"class": "",
				"route": "/temple",
				"text": "Temple"
			}
		]
	);

	return custom_header;
};

OF.addRoute = function(custom_routes, callback) {
	var templatesToLoad = ["temple.tpl", "character.tpl"];

	function loadTemplate(template, next) {
		fs.readFile(path.resolve(__dirname, './static/templates/' + template), function (err, data) {
			OF.templates[template] = data.toString();
			next(err);
		});
	}

	async.each(templatesToLoad, loadTemplate, function(err) {
		if (err) {
			throw new Error("Error loading templates: " + err);
		}
		
		custom_routes.routes = custom_routes.routes.concat(
			[
				{
					"route": "/character",
					"method": "get",
					"options": Character.render
				}
			],
			[
				{
					"route": "/temple",
					"method": "get",
					"options": Temple.render
				}
			]
		);

		callback(err, custom_routes);
	});
};

OF.init();
module.exports = OF;
