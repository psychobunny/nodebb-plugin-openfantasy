"use strict";
/*global translator*/

var openfantasy = openfantasy || {
	templates: {
		header: null,
		footer: null
	}
};

$(document).ready(function() {
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

	$(window).on('action:ajaxify.contentLoaded', function(url) {
		var content = $('#content');

		if (!content.children('.openfantasy').length) {
			var html = openfantasy.templates.header + content.html() + openfantasy.templates.footer;
			content.html(html);
		}
	});
});