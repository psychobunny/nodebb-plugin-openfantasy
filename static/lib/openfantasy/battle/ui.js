"use strict";

/*global define, config, ajaxify, bootbox*/

define('rpg/battle/ui', ['translator'], function(translator) {
	var ui = {};

	ui.toggleEligibleActions = function() {
		$('.btn-spell').prop('disabled', $('#spell').val() === '0');
		$('.btn-item').prop('disabled', $('#item').val() === '0');
	};

	ui.addActionHandlers = function(callback) {
		$('.btn').on('click', function() {
			if ($(this).attr('prevHtml')) {
				return;
			}

			$(this).attr('prevHtml', $(this).html());
			$(this).html('<i class="fa fa-spin fa-circle-o-notch"></i>');
		});
		
		$('.btn-initialize').on('click', function() {	
			$.post('/api/openfantasy/battle/initialize', {
				_csrf: config.csrf_token
			}, function(result) {
				ajaxify.refresh();
			});

			return false;
		});

		$('.btn-flee').on('click', function() {
			$.post('/api/openfantasy/battle/move', {
				move: 'flee',
				_csrf: config.csrf_token
			}, callback);

			return false;
		});

		$('.btn-defend').on('click', function() {
			$.post('/api/openfantasy/battle/move', {
				move: 'defend',
				_csrf: config.csrf_token
			}, callback);

			return false;
		});

		$('.btn-item').on('click', function() {
			bootbox.alert('Oops, Not implemented yet!');
			return false;
			useItem('item');

			$.post('/api/openfantasy/battle/move', {
				move: 'item',
				mid: $('#item').val(),
				_csrf: config.csrf_token
			}, callback);

			return false;
		});

		$('.btn-spell').on('click', function() {
			bootbox.alert('Oops, Not implemented yet!');
			return false;
			useItem('spell');
			
			$.post('/api/openfantasy/battle/move', {
				move: 'spell',
				mid: $('#spell').val(),
				_csrf: config.csrf_token
			}, callback);

			return false;
		});

		
		$('.btn-attack').on('click', function(ev) {
			useItem('attack');

			$.post('/api/openfantasy/battle/move', {
				move: 'attack',
				mid: $('#weapon').val(),
				_csrf: config.csrf_token
			}, callback);

			ev.preventDefault();
			ev.stopPropagation();
			return false;
		});

		$('.btn-restart').on('click', function() {
			ajaxify.refresh();
			return false;
		});


		function useItem(type) {
			var option = $('[data-user-item-id="' + $('#' + type).val() + '"]'),
				duration = (/: ([0-9]+) \//).exec(option.html());

			if (duration && duration[1]) {
				var select = option.parent();

				duration = parseInt(duration[1], 10) - 1;
				option.html(option.html().replace(/: ([0-9]+) \//, ': ' + duration + ' /'));	
				
				if (duration <= 0) {
					option.remove();

					if (!select.children().length) {
						if (type === 'spell') {
							select.append('<option data-user-item-id="0" value="0">[[of:battle_no_spell]]</option>');
						} else if (type === 'item') {
							select.append('<option data-user-item-id="0" value="0">[[of:battle_no_item]]</option>');
						}
					}
				}
			}
		}
	};

	return ui;
});