"use strict";

/*global define, config, ajaxify, bootbox, templates*/

define('forum/rpg/battle', ['translator', 'rpg/battle/ui', 'rpg/battle/turn'], function(translator, ui, turn) {
	var battle = {};

	battle.init = function() {
		$('#spell').on('change', ui.toggleEligibleActions);
		$('#item').on('change', ui.toggleEligibleActions);

		$('document').ready(function() {
			ui.toggleEligibleActions();
			ui.addActionHandlers(turn.go);

			$('.rpg-header li').removeClass('active');
			$('.rpg-header .battle').addClass('active');

			if (battle_text) {
				turn.go(battle_text);
			}
		});

		
	};

	return battle;
});