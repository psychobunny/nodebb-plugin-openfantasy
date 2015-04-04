"use strict";

/*global define*/

define('rpg/battle/turn', ['translator', 'rpg/battle/ui'], function(translator, ui) {
	var turn = {},
		eventsEl,

		messageDuration = 2000;

	///*initiative, challengerDamage, opponentDamage, or eventArray?*/
	turn.go = function(result) {
		var events = result.events;

		eventsEl = $('#events')
			.removeClass('in');

		$('input, button, select').prop('disabled', true);

		for (var i = 0, ii = events.length; i < ii; i++) {
			renderEvent(i, events);
		}

		setTimeout(function() {
			if (result.finished !== 1) {
				endTurn();
			} else {
				endBattle();
			}
		}, (events.length - 1) * messageDuration);
	};

	function renderEvent(i, events) {
		setTimeout(function() {
			eventsEl.removeClass('in');
			setTimeout(function() {
				translator.translate(events[i].message, function(message) {
					eventsEl.html(message);
					eventsEl.addClass('in');
				});
			}, 250);
		}, messageDuration * i);
	}

	function animateOpponentAttack() {
		$('.opponent_img').attr('src', $('.opponent_img').attr('src') + '?t=' + (new Date()).getTime());
	}

	function endTurn() {
		$('input, button, select').prop('disabled', false);
		ui.toggleEligibleActions();

		var loadingBtn = $('.btn[prevHtml]');
		loadingBtn.html(loadingBtn.attr('prevHtml')).removeAttr('prevHtml');
	}

	function endBattle() {
		var parents = $('input, button, select').parents('tr');
		parents.fadeOut(400, function() {
			parents.hide();
			$('.btn-restart').parents('tr').removeClass('hide');
		});
	}

	return turn;
});