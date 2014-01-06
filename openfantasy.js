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
	Character.create = function(req, res, callback) {
		if (req.user && req.user.uid) {
			var uid = req.user.uid;


			Character.getCharacterField(req.user.uid, 'character_id', function(err, data) {
				if (data === null) {
					var raceData = OF.data.races[req.body.character_race - 1],
						elementData = OF.data.elements[req.body.character_element - 1],
						classData = OF.data.classes[req.body.character_class - 1];

					var character_might = Math.floor(Math.random() * 10) + 10 + (raceData['race_might_bonus'] - raceData['race_might_penalty']),
						character_dexterity = Math.floor(Math.random() * 10) + 10 + (raceData['race_dexterity_bonus'] - raceData['race_dexterity_penalty']),
						character_constitution = Math.floor(Math.random() * 10) + 10 + (raceData['race_constitution_bonus'] - raceData['race_constitution_penalty']),
						character_intelligence = Math.floor(Math.random() * 10) + 10 + (raceData['race_intelligence_bonus'] - raceData['race_intelligence_penalty']),
						character_wisdom = Math.floor(Math.random() * 10) + 10 + (raceData['race_wisdom_bonus'] - raceData['race_wisdom_penalty']),
						character_charisma = Math.floor(Math.random() * 10) + 10 + (raceData['race_charisma_bonus'] - raceData['race_charisma_penalty']),
						character_magic_attack = Math.floor(Math.random() * 10) + 10 + (raceData['race_magic_attack_bonus'] - raceData['race_magic_attack_penalty']),
						character_magic_resistance = Math.floor(Math.random() * 10) + 10 + (raceData['race_magic_resistance_bonus'] - raceData['race_magic_resistance_penalty']),

						character_skill_mining = 1 + (raceData['race_skill_mining_bonus'] + elementData['element_skill_mining_bonus']),
						character_skill_stone = 1 + (raceData['race_skill_stone_bonus'] + elementData['element_skill_stone_bonus']),
						character_skill_forge = 1 + (raceData['race_skill_forge_bonus'] + elementData['element_skill_forge_bonus']),
						character_skill_enchantment = 1 + (raceData['race_skill_enchantment_bonus'] + elementData['element_skill_enchantment_bonus']),
						character_skill_trading = 1 + (raceData['race_skill_trading_bonus'] + elementData['element_skill_trading_bonus']),
						character_skill_thief = 1 + (raceData['race_skill_thief_bonus'] + elementData['element_skill_thief_bonus']),

						character_hp = classData['class_base_hp'],
						character_hp_max = classData['class_base_hp'],
						character_mp = classData['class_base_mp'],
						character_mp_max = classData['class_base_mp'],
						character_ac = classData['class_base_ac'];

					db.setObject('of:character:' + uid, {
						character_id: uid,
						character_name: req.body.character_name,
						character_desc: req.body.character_desc,
						character_race: req.body.character_race,
						character_class: req.body.character_class,
						character_alignment: req.body.character_alignment,
						character_element: req.body.character_element,
						character_hp: character_hp,
						character_hp_max: character_hp_max,
						character_mp: character_mp,
						character_mp_max: character_mp_max,
						character_ac: character_ac,
						character_xp: 0,
						character_level: 1,
						character_might: character_might,
						character_dexterity: character_dexterity,
						character_constitution: character_constitution,
						character_intelligence: character_intelligence,
						character_wisdom: character_wisdom,
						character_charisma: character_charisma,
						character_birth: Date.now(),
						character_battle_limit: OF.data.config['character_battle_limit'],
						character_skill_limit: OF.data.config['character_skill_limit'],
						character_trading_limit: OF.data.config['character_trading_limit'],
						character_thief_limit: OF.data.config['character_thief_limit'],
						character_sp: 0,
						character_magic_attack: character_magic_attack,
						character_magic_resistance: character_magic_resistance,
						character_skill_mining: character_skill_mining,
						character_skill_stone: character_skill_stone,
						character_skill_forge: character_skill_forge,
						character_skill_enchantment: character_skill_enchantment,
						character_skill_trading: character_skill_trading,
						character_skill_thief: character_skill_thief,
						character_skill_mining_uses: 0,
						character_skill_stone_uses: 0,
						character_skill_forge_uses: 0,
						character_skill_enchantment_uses: 0,
						character_skill_trading_uses: 0,
						character_skill_thief_uses: 0,
						character_victories: 0,
						character_defeats: 0,
						character_flees: 0,
						character_double_ko: 0,
						character_victories_pvp: 0,
						character_defeats_pvp: 0,
						character_flees_pvp: 0,
						character_fp: 0
					});
				} else {
					return res.send(403);
				}
			});
		} else {
			return res.redirect('/login');
		}

	};

	Character.getCharacterField = function(uid, field, callback) {
		db.getObjectField('of:character:' + uid, field, callback);
	};

	Character.getCharacterFields = function(uid, fields, callback) {
		db.getObjectFields('of:character:' + uid, fields, callback);
	};

	Character.getCharacterData = function(uid, callback) {
		db.getObject('of:character:' + uid, function(err, data) {
			if(err) {
				return callback(err);
			}

			callback(err, data);
		});
	};

	Character.delete = function(req, res, callback) {
		if (req.user && req.user.uid) {
			db.delete('of:character:' + req.user.uid, function(err) {
				callback({status: err === null, error: err});
			});
		}
	};

	Character.render = function(req, res, callback) {
		var content = templates.prepare(OF.templates['character.tpl']);

		if (req.user && req.user.uid) {
			Character.getCharacterData(req.user.uid, function(err, data) {
				if (data) {
					data.character = true;

					var classData = OF.data.classes[data.character_class-1],
						alignmentData = OF.data.alignments[data.character_alignment-1],
						elementData = OF.data.elements[data.character_element-1],
						raceData = OF.data.races[data.character_race-1];

					data.character_class = classData.class_name;
					data.class_img = classData.class_img;

					data.character_alignment = alignmentData.alignment_name;
					data.alignment_img = alignmentData.alignment_img;

					data.character_element = elementData.element_name;
					data.element_img = elementData.element_img;

					data.character_race = raceData.race_name;
					data.race_img = raceData.race_img;

					data.character_age = parseInt(OF.data.config.character_age, 10) + Math.ceil((Date.now() - data.character_birth) / 7862400);
					data._csrf = res.locals.csrf_token;

					translator.translate(content.parse(data), function(content) {
						callback({content: content});
					});
				} else {
					content = content.parse({
						"character": false,
						"races": OF.data.races,
						"classes": OF.data.classes,
						"elements": OF.data.elements,
						"alignments": OF.data.alignments,
						"_csrf": res.locals.csrf_token
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
		var content = templates.prepare(OF.templates['temple.tpl']);

		if (req.user && req.user.uid) {
			Character.getCharacterFields(req.user.uid, ["character_hp", "character_hp_max", "character_mp", "character_mp_max", "character_level"], function(err, data) {
				if (data) {
					data.heal_cost = Math.ceil(OF.data.config.temple_heal_cost * data.character_level);
					data.resurrect_cost = Math.ceil(OF.data.config.temple_resurrect_cost * data.character_level);

					content = content.parse(data);


					translator.translate(content, function(content) {
						callback({content: content});
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

OF.prepareTemplate = function(template) {

};

OF.addNavigation = function(custom_header, callback) {
	custom_header.navigation.push({
			"class": "",
			"route": "/character",
			"text": "RPG"
		});

	return custom_header;
};

OF.addRoute = function(custom_routes, callback) {
	var templatesToLoad = ["temple.tpl", "character.tpl", "header.tpl", "footer.tpl"];

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
					"route": "/character",
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
					"route": "/temple",
					"method": "get",
					"options": function(req, res, callback) {
						Temple.render(req, res, function(data) {
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

OF.init();
module.exports = OF;
