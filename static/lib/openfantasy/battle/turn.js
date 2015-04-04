"use strict";

/*global define*/

define('rpg/battle/turn', ['translator', 'rpg/battle/ui'], function(translator, ui) {
	var turn = {};

	///*initiative, challengerDamage, opponentDamage, or eventArray?*/
	turn.go = function(result) {
		ui.toggleEligibleActions();

		$('.opponent_img').attr('src', $('.opponent_img').attr('src') + '?t=' + (new Date()).getTime());

		var eventsEl = $('#events');
		
		eventsEl.removeClass('in');
		$('input, button, select').prop('disabled', true);
		
		var events = result.events,
			messageDuration = 2000;

		for (var i = 0, ii = events.length; i < ii; i++) {
			(function(i) {
				setTimeout(function() {
					eventsEl.removeClass('in');
					setTimeout(function() {
						translator.translate(events[i].message, function(message) {
							eventsEl.html(message);
							eventsEl.addClass('in');
						});
					}, 250);
				}, messageDuration * i);
			}(i));
		}

		setTimeout(function() {
			if (result.finished !== 1) {
				$('input, button, select').prop('disabled', false);
				var loadingBtn = $('.btn[prevHtml]');
				loadingBtn.html(loadingBtn.attr('prevHtml')).removeAttr('prevHtml');
			} else {
				var parents = $('input, button, select').parents('tr');
				parents.fadeOut(400, function() {
					parents.hide();
					$('.btn-restart').parents('tr').removeClass('hide');
				});
			}
		}, (events.length - 1) * messageDuration);
	};

	return turn;
});