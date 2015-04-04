"use strict";
/*global templates*/

var openfantasy = openfantasy || {
	templates: {
		header: null,
		footer: null
	}
};

(function() {
	function getCash() {
		$.get('/api/cash', function(cash) {
			openfantasy.cash = {
				currency: cash.currency,
				points: parseInt(cash.points, 10)
			};

			templates.setGlobal('l_points', cash.currency);
		});
	}

	function setup() {
		$.get('/templates/rpg/header.tpl', function(header) {
			translator.translate(header, function(translatedHeader) {
				openfantasy.templates.header = translatedHeader;
			});
		});

		$.get('/templates/rpg/footer.tpl', function(footer) {
			translator.translate(footer, function(translatedFooter) {
				openfantasy.templates.footer = translatedFooter;
			});
		});

		$(window).on('action:ajaxify.contentLoaded', function(ev, data) {
			var content = $('#content');

			if (data.url.match(/rpg\//)) {
				if (!content.children('.openfantasy').length) {
					var html = openfantasy.templates.header + content.html() + openfantasy.templates.footer;
					content.html(html);
				}

				getCash();
			}
		});

		getCash();
	}

	$(document).ready(function() {
		require(['translator'], function(module) {
			translator = module;
			setup();
		});
	});

	openfantasy.refreshCash = getCash;
}());