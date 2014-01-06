<!-- IF !character -->
<h3>Create a character</h3>
<div class="row create-character">
	<div class="col-lg-9">
		<div class="well">
			<form role="form">
				<div class="form-group">
					<label for="character_name">Character Name</label>
					<input type="email" class="form-control" id="character_name" placeholder="Enter your name...">
				</div>
				<div class="form-group">
					<label for="character_race">Character Race</label>
					<select class="form-control" id="character_race">
						<!-- BEGIN races -->
						<option value="{races.race_id}" data-desc="[[{races.race_desc}]]" data-src="{races.race_img}">[[{races.race_name}]]</option>
						<!-- END races -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_class">Character Class</label>
					<select class="form-control" id="character_class">
						<!-- BEGIN classes -->
						<option value="{classes.class_id}" data-desc="[[{classes.class_desc}]]" data-src="{classes.class_img}">[[{classes.class_name}]]</option>
						<!-- END classes -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_element">Select an Element</label>
					<select class="form-control" id="character_element">
						<!-- BEGIN elements -->
						<option value="{elements.element_id}" data-desc="[[{elements.element_desc}]]" data-src="{elements.element_img}">[[{elements.element_name}]]</option>
						<!-- END elements -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_alignment">Select an Alignment</label>
					<select class="form-control" id="character_alignment">
						<!-- BEGIN alignments -->
						<option value="{alignments.alignment_id}" data-desc="[[{alignments.alignment_desc}]]" data-src="{alignments.alignment_img}">[[{alignments.alignment_name}]]</option>
						<!-- END alignments -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_desc">Character Biography</label>
					<textarea class="form-control" id="character_desc" placeholder="Enter character's biography..."></textarea>
				</div>
				<button type="button" class="btn btn-primary btn-lg btn-block submit">Create Character</button>
			</form>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="alert alert-info details hidden">
			<div class="row text-center">
				<div class="col-lg-12">
					<img class="img-thumbnail" />
				</div>
				<div class="col-lg-12">
					<span>Hover for more information</span>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$('document').ready(function() {
	$('.create-character [data-desc]').on('mouseover', function() {
		$('.details span').html(this.getAttribute('data-desc'));
		$('.details img').attr('src', this.getAttribute('data-src'));
		$('.details').removeClass('hidden');
	})

	$('button.submit').on('click', function() {
		$.post('./api/openfantasy/character/create', {
			'character_alignment': $('#character_alignment').val(),
			'character_element': $('#character_element').val(),
			'character_race': $('#character_race').val(),
			'character_class': $('#character_class').val(),
			'character_name': $('#character_name').val(),
			'character_desc': $('#character_desc').val(),
			'_csrf': '{_csrf}'
		},function(data) {
			console.log(data);
		});
	});
});
</script>
<!-- ENDIF !character -->


<!-- IF character -->
<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
	<tr>
		<td align="center">

			<table class="table" cellspacing="2" cellpadding="0" border="2" align="center" width="100%">
				<tr>
					<td class="row1" align="center" width="60%" colspan="2"><b><span class="gen">{character_name}</span></b>
					<br /><span class="gen"><b>{l_level}: {level}; {char_year}</b></span></td>
				</tr>
				<tr>
					<td class="row2" align="center" colspan="2">{avatar_img}</td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">{l_class}</td>
					<td class="row2" align="center"><span class="gensmall"><img src="plugins/nodebb-plugin-openfantasy/images/classes/{class_img}" alt="[[{character_class}]]"><br />[[{character_class}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">{l_race}:</td>
					<td class="row2" align="center"><span class="gensmall"><img src="plugins/nodebb-plugin-openfantasy/images/races/{race_img}" alt="[[{character_race}]]"><br />[[{character_race}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">{l_element}:</td>
					<td class="row2" align="center"><span class="gensmall"><img src="plugins/nodebb-plugin-openfantasy/images/elements/{element_img}" alt="[[{character_element}]]"><br />[[{character_element}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">{l_alignment}:</td>
					<td class="row2" align="center"><span class="gensmall"><img src="plugins/nodebb-plugin-openfantasy/images/alignments/{alignment_img}" alt="[[{character_alignment}]]"><br />[[{character_alignment}]]</span></td>
				</tr>
			</table>
			<!-- begin owner -->
			<table class="table" cellspacing="1" cellpadding="1" border="1" align="center" width="100%">
				<tr>
					<td align="center" class="row2" ><input type="submit" name="bio_edit" value="{l_edit_character}" class="liteoption" /></td>
				</tr>
				<!-- begin delete -->
				<tr>
					<td align="center" class="row2" ><input type="submit" name="delete" value="{l_delete_character}" class="liteoption" /></td>
				</tr>
				<!-- end delete -->
			</table>
			<!-- end owner -->
		</span></td>

		<td class="row1" align="center">
			<table class="table" cellspacing="2" cellpadding="1" border="1" align="center" width="100%">
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span class="gensmall">{l_hp} {character_hp} / {character_hp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_red_middle.gif" width="{hp_percent_width}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{hp_percent_empty}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_red_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span class="gensmall">{l_mp} {character_mp} / {character_mp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_middle.gif" width="{mp_percent_width}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{mp_percent_empty}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span class="gensmall">{l_weight}: {weight} / {weight_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_begin.gif" width="6" height="13" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_middle.gif" width="{weight_percent_width}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{weight_percent_empty}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span class="gensmall">{l_experience} {exp} / {exp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_green_begin.gif" width="6" height="13" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_green_middle.gif" width="{exp_percent_width}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{exp_percent_empty}" height="13" border="0" /><img src="plugins/nodebb-plugin-openfantasy/images/misc/bar_green_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
                <tr>
                    <td align="center" class="row1" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/au.gif" alt="{l_points}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_points}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{points}</span></td>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/dex.gif" alt="{l_agility}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_agility}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{agility}</span></td>
                </tr>
                <tr>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/sp.gif" alt="{l_sp}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_sp}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{sp}</span></td>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/const.gif" alt="{l_constit}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_constit}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{constit}</span></td>
                </tr>
                <tr>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/sp.gif" alt="{l_fp}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_fp}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{fp}</span></td>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/int.gif" alt="{l_int}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_int}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{int}</span></td>
                </tr>
                <tr>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/ac.gif" alt="{l_ac}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_ac}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{ac}</span></td>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/look.gif" alt="{l_wis}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_wis}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{wis}</span></td>
                </tr>
                <tr>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/str.gif" alt="{l_power}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_power}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{power}</span></td>
                    <td align="center" class="row2" width="5%"><img src="plugins/nodebb-plugin-openfantasy/images/misc/cha.gif" alt="{l_cha}"></td>
                    <td align="center" class="row2" width="35%"><span class="gensmall">{l_cha}</span></td>
                    <td align="center" class="row2" width="10%"><span class="gensmall">{cha}</span></td>
                </tr>
			</table>
		</span></td>
	</tr>
</table>
<br clear="all" />
<table class="table" cellspacing="1" cellpadding="1" border="1" align="center" width="90%">
	<tr>
		<th align="center" colspan="3">{l_battle_statistics}</th>
	</tr>
	<tr>
		<td align="center" class="row1" width="60%">&nbsp;</td>
		<td align="center" class="row2" width="20%"><span class="gensmall"><b>{l_stats_monster}</b>:</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall"><b>{l_stats_pvp}</b>:</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_victories}:</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_victories}</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_victories_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_defeats}:</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_defeats}</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_defeats_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_flees}:</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_flees}</span></td>
		<td align="center" class="row2" width="20%"><span class="gensmall">{battle_flees_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="catbottom" colspan="3">
			<input type="submit" name="battle_monsters" value="{l_battle_see_monsters}" class="liteoption" />
			&nbsp;&nbsp;
			<input type="submit" name="battle_players" value="{l_battle_see_players}" class="liteoption" />
		</td>
	</tr>
</table>
<!-- ENDIF character -->