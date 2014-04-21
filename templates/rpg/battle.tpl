<!-- IF !battle_id -->
	<!-- BEGIN equipment_types -->
	<div class="well">
		<h4>{equipment_types.item_type_name} <small>{equipment_types.equipped.item_name}</small></h4>
	</div>
	<!-- END equipment_types -->
	<a href="/rpg/equipment" class="btn btn-lg btn-block btn-default btn-fight">[[of:equip_change]]</a>
	<button class="btn btn-lg btn-block btn-primary btn-fight">[[of:battle_fight]]</button>
<!-- ENDIF !battle_id -->

<!-- IF battle_id -->
<form>
<table width="100%" class="forumline" align="center" valign="middle">
	<tr>
		<th align="center" width="100%" valign="middle" colspan="3">
			{character_name}&nbsp;vs&nbsp;{monster_name}
		</th>
	</tr>
	<tr>
		<td class="row2" align="center" width="40%" valign="top">
			<table width="100%">
				<tr>
					<td colspan="3" align="center" valign="top" height="25"><b><span class="gen">{character_name}</span></b></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_health]] {HP} / {HP_MAX}</td>
					<td align="center" rowspan="4" colspan="2" height="75%">{AVATAR_IMG}&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><img src="adr/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="adr/images/misc/bar_red_middle.gif" width="{HP_WIDTH}" height="13" /><img src="adr/images/misc/bar_emp.gif" width="{HP_EMPTY}" height="13" border="0" /><img src="adr/images/misc/bar_red_end.gif" width="6" height="13" /></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_magic]] {MP} / {MP_MAX}</td>
				</tr>
				<tr>
					<td align="center"><img src="adr/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="adr/images/misc/bar_blue_middle.gif" width="{MP_WIDTH}" height="13" /><img src="adr/images/misc/bar_emp.gif" width="{MP_EMPTY}" height="13" border="0" /><img src="adr/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
				</tr>
			</table></td>
		<td class="row1" align="center" width="20%"><img src="./adr/images/misc/vs.gif" /></td>
		<td class="row2" align="center" width="40%" valign="top">
			<table width="100%">
				<tr>
					<td colspan="3" align="center" height="25" valign="top"><b><span class="gen">{MONSTER_NAME}</span></b></td>
				</tr>
				<tr>
					<td align="center" rowspan="4" colspan="2" height="75%"><img src="./adr/images/monsters/{MONSTER_IMG}" /></td>
					<td align="center"><span class="gensmall">[[of:character_health]] {MONSTER_HP} / {MONSTER_HP_MAX}</td>
				</tr>
				<tr>
					<td align="center"><img src="adr/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="adr/images/misc/bar_red_middle.gif" width="{MONSTER_HP_WIDTH}" height="13" /><img src="adr/images/misc/bar_emp.gif" width="{MONSTER_HP_EMPTY}" height="13" border="0" /><img src="adr/images/misc/bar_red_end.gif" width="6" height="13" /></td>
				</tr>
				<tr>
					<td align="center"><span class="gensmall">[[of:character_magic]] {MONSTER_MP} / {MONSTER_MP_MAX}</td>
				</tr>
				<tr>
					<td align="center"><img src="adr/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="adr/images/misc/bar_blue_middle.gif" width="{MONSTER_MP_WIDTH}" height="13" /><img src="adr/images/misc/bar_emp.gif" width="{MONSTER_MP_EMPTY}" height="13" border="0" /><img src="adr/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
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
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_att]]:</b> {ATT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_def]]:</b> {DEF}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_att]]:</b> {M_ATT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_def]]:</b> {M_DEF}</span><br />
			</td>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_alignment]]:</b> {ALIGNMENT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_element]]:</b> {ELEMENT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_class]]:</b> {CLASS}</span><br />
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
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_att]]:</b> {MONSTER_ATT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_phy_def]]:</b> {MONSTER_DEF}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_att]]:</b> {MONSTER_M_ATT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_mag_def]]:</b> {MONSTER_M_DEF}</span><br />
			</td>
                <td class="row1" width="50%" valign="top">
			<span class="gensmall">&nbsp;<b>[[of:battle_alignment]]:</b> {MONSTER_ALIGNMENT}</span><br />
			<span class="gensmall">&nbsp;<b>[[of:battle_element]]:</b> {MONSTER_ELEMENT}</span><br />
			</td>
              </tr>
              </table>
        </td>
	</tr>
	<tr>
		<td align="center" class="row1" valign="top" colspan="3">
			<iframe width="100%" height="200" left="0" frameborder=0 src="{S_CHATBOX}" class="row1"></iframe>
		</td>
	</tr>
</table>
<br clear="all" />

<table cellspacing="0" cellpadding="3" border="1" align="center" class="forumline" width="80%">
	</tr>
		<th align="center" colspan="2" >[[of:actions_opponent]]</th>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%" >{ATTACK}&nbsp;&nbsp;&nbsp;</td>
		<td align="left" class="row2" width="50%" >&nbsp;&nbsp;&nbsp;<input type="submit" style="width: 125" value="[[of:attack_opponent]]" name="attack" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="right" class="row1" width="50%" >{SPELL}&nbsp;&nbsp;&nbsp;</td>
		<td align="left" class="row1" width="50%" >&nbsp;&nbsp;&nbsp;<input type="submit" style="width: 125" value="[[of:spell_opponent]]" name="spell" class="mainoption" /></td>
	</tr>
	</tr>
		<td align="right" class="row2" width="50%" >{POTION}&nbsp;&nbsp;&nbsp;</td>
		<td align="left" class="row2" width="50%" >&nbsp;&nbsp;&nbsp;<input type="submit" style="width: 125" value="[[of:potion_opponent]]" name="potion" class="mainoption" /></td>
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
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .battle').addClass('active');
	});
</script>