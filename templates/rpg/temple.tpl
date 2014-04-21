<!-- IF in_battle -->
<div class="alert alert-danger">[[of:battle_progress]]</div>
<!-- ELSE -->
<div class="well">
	<label for="heal">[[of:temple_heal_cost]] : {heal_cost} {l_points}</label>
	<button class="form-control btn-primary heal">[[of:temple_heal]]</button>
</div>
<div class="well">
	<label for="resurrect">[[of:temple_resurrect_cost]] : {resurrect_cost} {l_points}</label>
	<button class="form-control btn-primary resurrect">[[of:temple_resurrect]]</button>
</div>
<!-- ENDIF in_battle -->


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .temple').addClass('active');
	});
</script>