<!-- IF !battle_id -->
	<!-- BEGIN equipment_types -->
	<div class="well">
		<h4>{equipment_types.item_type_name} <small>{equipment_types.equipped.item_name}</small></h4>
	</div>
	<!-- END equipment_types -->
	<a href="/rpg/equipment" class="btn btn-lg btn-block btn-default">[[of:equip_change]]</a>
	<button class="btn btn-lg btn-block btn-primary btn-initialize">[[of:battle_fight]]</button>
<!-- ENDIF !battle_id -->

<!-- IF battle_id -->
<form>
<table width="100%" class="table" align="center" valign="middle">
	<tr>
		<th align="center" width="100%" valign="middle" colspan="3" style="text-align: center; background: url(../plugins/nodebb-plugin-openfantasy/images/backgrounds/battle_bgnd_1.gif); background-size: contain;">
			<img src="{battle_opponent_img}" /><br /><br />
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
			</div>
		</th>
	</tr>
	<tr>
		<td colspan="3" align="center" valign="top" height="60" style="background: #333; border: 0">
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
			<!-- BEGIN weapons -->
				<option value="{weapons.user_item_id}">{weapons.item_id} ({weapons.item_duration} / {weapons.item_duration_max})</option>
			<!-- END weapons -->
			</select>
		</td>
		<td align="left" class="row2" width="50%"><button class="btn btn-primary btn-attack btn-block">[[of:attack_opponent]]</button></td>
	</tr>
	<tr>
		<td align="right" class="row1" width="50%">
			<select class="form-control" id="spell">
			<!-- BEGIN spell -->
				<option value="{spell.user_item_id}" >{spell.item_id} ({spell.item_duration} / {spell.item_duration_max})</option>
			<!-- END spell -->
			</select>
		</td>
		<td align="left" class="row1" width="50%"><button class="btn btn-primary btn-spell btn-block">[[of:spell_opponent]]</button></td>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%">
			<select class="form-control" id="potion">
			<!-- BEGIN potion -->
				<option value="{potion.user_item_id}">{potion.item_id} ({potion.item_duration} / {potion.item_duration_max})</option>
			<!-- END potion -->
			</select>
		</td>
		<td align="left" class="row2" width="50%"><button class="btn btn-primary btn-potion btn-block">[[of:potion_opponent]]</button></td>
	<tr>
	</tr>
		<td align="center" class="row1" width="100%" colspan="2" ><button class="btn btn-info btn-defend btn-block">[[of:defend_opponent]]</button></td>
	</tr>
	<tr>
		<td align="center" class="row2" width="100%" colspan="2" ><button class="btn btn-danger btn-flee btn-block">[[of:flee_opponent]]</button></td>
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
			ajaxify.refresh();
		});

		return false;
	});

	$('.btn-defend').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'defend',
			_csrf: $('#csrf_token').val()
		}, function(result) {
			ajaxify.refresh();
		});

		return false;
	});

	$('.btn-potion').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'potion',
			mid: $('#potion').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			ajaxify.refresh();
		});

		return false;
	});

	$('.btn-spell').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'spell',
			mid: $('#spell').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			ajaxify.refresh();
		});

		return false;
	});

	$('.btn-attack').on('click', function() {
		$.post('/api/openfantasy/battle/move', {
			move: 'attack',
			mid: $('#weapon').val(),
			_csrf: $('#csrf_token').val()
		}, function(result) {
			ajaxify.refresh();
		});

		return false;
	});

	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .battle').addClass('active');
	});
</script>