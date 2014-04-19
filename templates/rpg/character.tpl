<!-- IF !character -->
<h3>Create a character</h3>
<div class="row create-character">
	<div class="col-lg-9">
		<div class="well">
			<form role="form">
				<div class="form-group">
					<label for="character_name">Character Name</label>
					<input type="text" class="form-control" id="character_name" placeholder="Enter your name...">
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
		$.post('/api/openfantasy/character/create', {
			'character_alignment': $('#character_alignment').val(),
			'character_element': $('#character_element').val(),
			'character_race': $('#character_race').val(),
			'character_class': $('#character_class').val(),
			'character_name': $('#character_name').val(),
			'character_desc': $('#character_desc').val(),
			'_csrf': $('#csrf_token').val()
		},function(data) {
			ajaxify.go('character');
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
					<br /><span class="gen"><b>[[of:character_level]]: {character_level}; [[of:character_age_old, {character_age}]]</b></span></td>
				</tr>
				<!--<tr>
					<td align="center" colspan="2">{avatar_img}</td>
				</tr>-->
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">[[of:character_class]]:</td>
					<td align="center"><span><img src="{class_img}" alt="[[{character_class}]]"><br />[[{character_class}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">[[of:character_race]]:</td>
					<td align="center"><span><img src="{race_img}" alt="[[{character_race}]]"><br />[[{character_race}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">[[of:character_element]]:</td>
					<td align="center"><span><img src="{element_img}" alt="[[{character_element}]]"><br />[[{character_element}]]</span></td>
				</tr>
				<tr>
					<td class="row1" align="center" width="40%"><span class="gen">[[of:character_alignment]]:</td>
					<td align="center"><span><img src="{alignment_img}" alt="[[{character_alignment}]]"><br />[[{character_alignment}]]</span></td>
				</tr>
			</table>
			<!-- begin owner -->
			<table class="table" cellspacing="1" cellpadding="1" border="1" align="center" width="100%">
				<tr>
					<td align="center" ><button class="form-control bio_edit">[[of:character_edit]]</button></td>
				</tr>
				<!-- begin delete -->
				<tr>
					<td align="center" ><button class="form-control btn-danger delete">[[of:character_delete]]</button></td>
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
							<td align="center"><span>[[of:character_health]] {character_hp} / {character_hp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_middle.gif" width="{hp_percent_width}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{hp_percent_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_red_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span>[[of:character_magic]] {character_mp} / {character_mp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_middle.gif" width="{mp_percent_width}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{mp_percent_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_blue_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span>[[of:character_weight]]: {character_weight} / {character_weight_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_middle.gif" width="{weight_percent_width}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{weight_percent_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6" class="row2">
						<table class="table" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
						<tr>
							<td align="center"><span>[[of:character_experience]]: {character_xp} / {character_xp_max}</td>
						</tr>
						<tr>
							<td align="center">&nbsp;<img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_green_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_green_middle.gif" width="{exp_percent_width}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{exp_percent_empty}" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_green_end.gif" width="6" height="13" /></td>
						</tr>
						</table>
					</td>
				</tr>
                <tr>
                    <td align="center" class="row1" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/au.gif" alt="[[of:character_points]]"></td>
                    <td align="center" width="35%"><span>[[of:character_points]]</span></td>
                    <td align="center" width="10%"><span>{character_points}</span></td>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/dex.gif" alt="[[of:character_dexterity]]"></td>
                    <td align="center" width="35%"><span>[[of:character_dexterity]]</span></td>
                    <td align="center" width="10%"><span>{character_dexterity}</span></td>
                </tr>
                <tr>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/sp.gif" alt="[[of:character_sp]]"></td>
                    <td align="center" width="35%"><span>[[of:character_sp]]</span></td>
                    <td align="center" width="10%"><span>{character_sp}</span></td>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/const.gif" alt="[[of:character_constitution]]"></td>
                    <td align="center" width="35%"><span>[[of:character_constitution]]</span></td>
                    <td align="center" width="10%"><span>{character_constitution}</span></td>
                </tr>
                <tr>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/sp.gif" alt="[[of:character_fp]]"></td>
                    <td align="center" width="35%"><span>[[of:character_fp]]</span></td>
                    <td align="center" width="10%"><span>{character_fp}</span></td>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/int.gif" alt="[[of:character_intelligence]]"></td>
                    <td align="center" width="35%"><span>[[of:character_intelligence]]</span></td>
                    <td align="center" width="10%"><span>{character_intelligence}</span></td>
                </tr>
                <tr>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/ac.gif" alt="[[of:character_ac]]"></td>
                    <td align="center" width="35%"><span>[[of:character_ac]]</span></td>
                    <td align="center" width="10%"><span>{character_ac}</span></td>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/look.gif" alt="[[of:character_wisdom]]"></td>
                    <td align="center" width="35%"><span>[[of:character_wisdom]]</span></td>
                    <td align="center" width="10%"><span>{character_wisdom}</span></td>
                </tr>
                <tr>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/str.gif" alt="[[of:character_might]]"></td>
                    <td align="center" width="35%"><span>[[of:character_might]]</span></td>
                    <td align="center" width="10%"><span>{character_might}</span></td>
                    <td align="center" width="5%"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/cha.gif" alt="[[of:character_charisma]]"></td>
                    <td align="center" width="35%"><span>[[of:character_charisma]]</span></td>
                    <td align="center" width="10%"><span>{character_charisma}</span></td>
                </tr>
			</table>
		</span></td>
	</tr>
</table>
<!-- after I implement battle.
<br clear="all" />
<table class="table" cellspacing="1" cellpadding="1" border="1" align="center" width="90%">
	<tr>
		<th align="center" colspan="3">{l_battle_statistics}</th>
	</tr>
	<tr>
		<td align="center" class="row1" width="60%">&nbsp;</td>
		<td align="center" width="20%"><span><b>{l_stats_monster}</b>:</span></td>
		<td align="center" width="20%"><span><b>{l_stats_pvp}</b>:</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_victories}:</span></td>
		<td align="center" width="20%"><span>{battle_victories}</span></td>
		<td align="center" width="20%"><span>{battle_victories_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_defeats}:</span></td>
		<td align="center" width="20%"><span>{battle_defeats}</span></td>
		<td align="center" width="20%"><span>{battle_defeats_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="row1" width="59%"><span class="gen">&nbsp;&nbsp;{l_battle_flees}:</span></td>
		<td align="center" width="20%"><span>{battle_flees}</span></td>
		<td align="center" width="20%"><span>{battle_flees_pvp}</span></td>
	</tr>
	<tr>
		<td align="center" class="catbottom" colspan="3">
			<input class="form-control" type="submit" name="battle_monsters" value="{l_battle_see_monsters}" />
			<input class="form-control" type="submit" name="battle_players" value="{l_battle_see_players}" />
		</td>
	</tr>
</table>
-->

<script type="text/javascript">
$('document').ready(function() {
	$('button.delete').on('click', function() {
		bootbox.confirm('<strong>[[of:character_delete_confirm]]</strong>', function(confirm) {
			if (confirm) {
				$.post('/api/openfantasy/character/delete', {'_csrf': $('#csrf_token').val()},function(data) {
					ajaxify.go('character');
				});
			}
		});
	})
});

</script>
<!-- ENDIF character -->


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .character').addClass('active');
	});
</script>