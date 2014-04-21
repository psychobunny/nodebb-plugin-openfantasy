<!-- IF !battle_id -->
	<!-- BEGIN equipment_types -->
	<div class="well">
		<h4>{equipment_types.item_type_name} <small>{equipment_types.equipped.item_name}</small></h4>
	</div>
	<!-- END equipment_types -->
	<a href="/rpg/equipment" class="btn btn-lg btn-block btn-warning">[[of:equip_change]]</a>
	<button class="btn btn-lg btn-block btn-primary btn-initialize">[[of:battle_fight]]</button>
<!-- ENDIF !battle_id -->

<!-- IF battle_id -->
<form>
<table width="100%" class="table" align="center" valign="middle">
	<tr>
		<th align="center" width="100%" valign="middle" colspan="3" style="text-align: center; background: url(../plugins/nodebb-plugin-openfantasy/images/backgrounds/battle_bgnd_1.gif); background-size: contain;">
			<div style="margin-left: auto; margin-right: auto; width: 130px;">
				<strong style="color: white; text-shadow: 1px 1px #111;">{battle_opponent_name}</strong><br />
				<div class="progress progress-striped active" style="height: 8px; width: 100%; margin: 0; border: 1px solid #555;">
				  <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
				  </div>
				</div>
				<div class="progress progress-striped active" style="height: 8px; width: 100%; margin: 0; border: 1px solid #555;">
				  <div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
				  </div>
				</div>
			</div><br />
			<img src="{battle_opponent_img}" />
		</th>
	</tr>
	<tr>
		<td colspan="3" align="center" valign="top" height="60" style="background: #333; border: 0">
			<p style="color: #333; text-shadow: 1px 1px #eee; background: white; height: 23px;">
				<span id="events" class="fade in"></span>
			</p>
			<img src="../plugins/nodebb-plugin-openfantasy/images/misc/vs.gif" style="width: 50px; height: 50px; margin-bottom: 5px;" />
			<div style="margin-left: auto; margin-right: auto; width: 130px;">
				<strong style="color: white; text-shadow: 1px 1px #111;">{character_name}</strong><br />
				<div class="progress progress-striped active" style="height: 8px; width: 100%; margin: 0; border: 1px solid #555;">
				  <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
				  </div>
				</div>
				<div class="progress progress-striped active" style="height: 8px; width: 100%; margin: 0; border: 1px solid #555;">
				  <div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
				  </div>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<div class="row">
				<div class="col-xs-6">
					<span><strong>[[of:character_health]]</strong>: {battle_challenger_hp} / {battle_challenger_hp_max}</span>
				</div>
				<div class="col-xs-6">
					<span><strong>[[of:character_magic]]</strong>: {battle_challenger_mp} / {battle_challenger_mp_max}</span>
				</div>
			</div>
		</td>
	</tr>
	<!-- I always thought it was weird that ADR let you see yours vs monster stats
	<tr>
		<td class="row1" width ="40%">
		<table border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" class="table">
			<th width="100%" valign="top" colspan="2" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				[[of:battle_attributes]]:
			</th>
              <tr>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_att]]:</b> {battle_challenger_att}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_def]]:</b> {battle_challenger_def}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_att]]:</b> {battle_challenger_magic_attack}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_def]]:</b> {battle_challenger_magic_resistance}</span><br />
			</td>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_alignment]]:</b> {battle_challenger_alignment}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_element]]:</b> {battle_challenger_element}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_class]]:</b> {battle_challenger_class}</span><br />
			</td>
              </tr>
            </table>
        </td>
		<td class="row1" width ="40%">
			<table border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" class="table">
			<th width="100%" valign="top" colspan="2" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				[[of:battle_attributes]]:
			</th>
              <tr>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_att]]:</b> {battle_opponent_att}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_def]]:</b> {battle_opponent_def}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_att]]:</b> {battle_opponent_magic_att}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_def]]:</b> {battle_opponent_magic_resistance}</span><br />
			</td>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_alignment]]:</b> {battle_opponent_alignment}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_element]]:</b> {battle_opponent_element}</span><br />
			</td>
              </tr>
              </table>
        </td>
	</tr>
	<tr>
		{battle_text}
	</tr>
	-->
	<tr>
		<td align="right" class="row2" width="50%">
			<select class="form-control" id="weapon">
			<!-- BEGIN wieldable -->
				<option data-user-item-id="{items.wieldable.user_item_id}" value="{items.wieldable.user_item_id}">{items.wieldable.battle_description}</option>
			<!-- END wieldable -->
			</select>
		</td>
		<td align="left" class="row2" width="50%"><button class="btn btn-primary btn-attack btn-block">[[of:attack_opponent]]</button></td>
	</tr>
	<tr>
		<td align="right" class="row1" width="50%">
			<select class="form-control" id="spell">
			<!-- BEGIN castable -->
				<option data-user-item-id="{items.castable.user_item_id}" value="{items.castable.user_item_id}">{items.castable.battle_description}</option>
			<!-- END castable -->
			</select>
		</td>
		<td align="left" class="row1" width="50%"><button class="btn btn-primary btn-spell btn-block">[[of:spell_opponent]]</button></td>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%">
			<select class="form-control" id="item">
			<!-- BEGIN usable -->
				<option data-user-item-id="{items.usable.user_item_id}" value="{items.usable.user_item_id}">{items.usable.battle_description}</option>
			<!-- END usable -->
			</select>
		</td>
		<td align="left" class="row2" width="50%"><button class="btn btn-primary btn-item btn-block">[[of:item_opponent]]</button></td>
	<tr>
	</tr>
		<td align="center" class="row1" width="100%" colspan="2" ><button class="btn btn-info btn-defend btn-block">[[of:defend_opponent]]</button></td>
	</tr>
	<tr>
		<td align="center" class="row2" width="100%" colspan="2" ><button class="btn btn-danger btn-flee btn-block">[[of:flee_opponent]]</button></td>
	</tr>
	<tr class="hide">
		<td align="center" class="row2" width="100%" colspan="2" ><a class="btn btn-primary btn-restart btn-block">[[of:battle_return]]</a></td>
	</tr>
</table>
</form>
<!-- ENDIF battle_id -->



<script type="text/javascript">
	$('.btn-initialize').on('click', function() {
		$.post('/api/openfantasy/battle/initialize', {
			_csrf: $('#csrf_token').val()
		}, function(result) {
			ajaxify.refresh();
		});

		return false;
	});

	$('.btn-flee').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'flee',
			_csrf: $('#csrf_token').val()
		}, function(result) {
			turn(result);
		});

		return false;
	});

	$('.btn-defend').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'defend',
			_csrf: $('#csrf_token').val()
		}, function(result) {
			turn(result);
		});

		return false;
	});

	$('.btn-item').on('click', function() {
		useItem('item');

		$.post('/api/openfantasy/battle/move', {
			move: 'item',
			mid: $('#item').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			turn(result);
		});

		return false;
	});

	$('.btn-spell').on('click', function() {
		useItem('spell');
		
		$.post('/api/openfantasy/battle/move', {
			move: 'spell',
			mid: $('#spell').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			turn(result);
		});

		return false;
	});

	$('.btn-attack').on('click', function() {
		useItem('attack');

		$.post('/api/openfantasy/battle/move', {
			move: 'attack',
			mid: $('#weapon').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			turn(result);
		});

		return false;
	});

	$('.btn-restart').on('click', function() {
		ajaxify.refresh();
		return false;
	});
	try {
		var battle_text = JSON.parse('{battle_text}');
		if (battle_text) {
			turn(battle_text);
		}
	} catch (e) {}
	


	///*initiative, challengerDamage, opponentDamage, or eventArray?*/
	function turn(result) {
		disableButtonsIfNoItem();


		$('input, button, select').prop('disabled', true)

		var events = result.events,
			eventsEl = $('#events'),
			messageDuration = 1250;

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
				$('input, button, select').prop('disabled', false)
			} else {
				var parents = $('input, button, select').parents('tr');
				parents.fadeOut(400, function() {
					parents.hide();
					$('.btn-restart').parents('tr').removeClass('hide');
				});
				
			}
		}, events.length * messageDuration);
	}

	function disableButtonsIfNoItem() {
		$('.btn-spell').prop('disabled', $('#spell').val() === '0');
		$('.btn-item').prop('disabled', $('#item').val() === '0');
	}

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
					} else if (type == 'item') {
						select.append('<option data-user-item-id="0" value="0">[[of:battle_no_item]]</option>');
					}
				}
			}
		}
	}

	$('#spell').on('change', disableButtonsIfNoItem);
	$('#item').on('change', disableButtonsIfNoItem);

	$('document').ready(function() {
		disableButtonsIfNoItem();

		$('.rpg-header li').removeClass('active');
		$('.rpg-header .battle').addClass('active');
	});
</script>