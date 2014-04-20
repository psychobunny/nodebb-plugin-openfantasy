<form method="post" action="{S_CHARACTER_ACTION}">
<br />

<table cellspacing="1" cellpadding="1" border="1" align="center" class="table" width="100%">
	<tr>
		<td class="row2" align="center" width="15%"><span class="gen"><b>[[of:races_image]]</b></span></td>
		<td class="row2" align="center" width="10%"><span class="gen"><b>[[of:character_level]]</b></span></td>
		<td class="row2" align="center" width="30%"><span class="gen"><b>[[of:races_desc]]</b></span></td>
		<td class="row2" align="center" width="45%"><span class="gen"><b>[[of:character_progress]]</b></span></td>
	</tr>
	<!-- BEGIN skills -->
	<tr>
		<td class="row1" align="center"><img src="{skills.skill_img}" alt="{skills.skill_name}"></td>
		<td class="row1" align="center"><span class="gen">{skills.skill_level}</span></td>
		<td class="row1" align="center"><span class="gensmall">{skills.skill_desc}</span></td>
		<td class="row1" align="center">
			<table class="table" align="center" width="100%" height="100%">
				<tr>
					<td align="center"><span class="gensmall">{skills.skill_name}: {skills.skill_min} / {skills.skill_max}</td>
				</tr>
				<tr>
					<td align="center"><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_begin.gif" width="6" height="13" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_middle.gif" width="{skills.skill_bar}%" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_emp.gif" width="{skills.skill_bar_empty}%" height="13" border="0" /><img src="../plugins/nodebb-plugin-openfantasy/images/misc/bar_orange_end.gif" width="6" height="13" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<!-- END skills -->
</table>
</form>
<br clear="all" />


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .skills').addClass('active');
	});
</script>