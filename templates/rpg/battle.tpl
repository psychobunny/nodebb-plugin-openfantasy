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
<table width="100%" class="forumline" align="center" valign="middle">
	<tr>
		<th align="center" width="100%" valign="middle" colspan="3">
			{character_name}&nbsp;vs&nbsp;{battle_opponent_name}
		</th>
	</tr>
	<tr>
		<td class="row2" align="center" width="40%" valign="top">
			<table width="100%">
				<tr>
					<td colspan="3" align="center" valign="top" height="25"><b><span class="gen">{character_name}</span></b></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_health]] {battle_challenger_hp} / {battle_challenger_hp_max}</td>
					<td align="center" rowspan="4" colspan="2" height="75%">{avatar_img}&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_middle.gif" width="{hp_width}" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{hp_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_end.gif" width="6" height="13" /></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_magic]] {battle_challenger_mp} / {battle_challenger_mp_max}</td>
				</tr>
				<tr>
					<td align="center"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_middle.gif" width="{mp_width}" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{mp_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
				</tr>
			</table></td>
		<td class="row1" align="center" width="20%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/vs.gif" /></td>
		<td class="row2" align="center" width="40%" valign="top">
			<table width="100%">
				<tr>
					<td colspan="3" align="center" height="25" valign="top"><b><span class="gen">{battle_opponent_name}</span></b></td>
				</tr>
				<tr>
					<td align="center" rowspan="4" colspan="2" height="75%"><img src="{battle_opponent_img}" /></td>
					<td align="center"><span class="gensmall">[[of:character_health]] {battle_opponent_hp} / {battle_opponent_hp_max}</td>
				</tr>
				<tr>
					<td align="center"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_middle.gif" width="{monster_hp_width}" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{monster_hp_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_end.gif" width="6" height="13" /></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_magic]] {battle_opponent_mp} / {battle_opponent_mp_max}</td>
				</tr>
				<tr>
					<td align="center"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_middle.gif" width="{monster_mp_width}" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{monster_mp_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td class="row1" width ="40%">
		<table border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" class="forumline">
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
		<td class="row1">&nbsp;</td>
		<td class="row1" width ="40%">
			<table border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" class="forumline">
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
</table>
<br clear="all" />

<table cellspacing="0" cellpadding="3" border="1" align="center" class="forumline" width="80%">
	</tr>
		<th align="center" colspan="2" >[[of:actions_opponent]]</th>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%">{attack}</td>
		<td align="left" class="row2" width="50%"><input type="submit" style="width: 125" value="[[of:attack_opponent]]" name="attack" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="right" class="row1" width="50%">{spell}</td>
		<td align="left" class="row1" width="50%"><input type="submit" style="width: 125" value="[[of:spell_opponent]]" name="spell" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%">{potion}</td>
		<td align="left" class="row2" width="50%"><input type="submit" style="width: 125" value="[[of:potion_opponent]]" name="potion" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="center" class="row1" width="100%" colspan="2" ><input type="submit" style="width: 125" value="[[of:defend_opponent]]" name="defend" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="center" class="row2" width="100%" colspan="2" ><input type="submit" style="width: 125" value="[[of:flee_opponent]]" name="flee" class="mainoption" /></td>
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
	});

	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .battle').addClass('active');
	});
</script>