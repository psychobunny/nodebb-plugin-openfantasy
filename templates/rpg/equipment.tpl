<!-- IF owner -->
<h3>[[of:equip_title]]</h3>
<!-- IF owner -->

<!-- BEGIN equipment_types -->
<div class="well">
	<h4>{equipment_types.name}</h4>
	<select class="form-control">
		<!-- BEGIN items -->
		<option value="{equipment_types.items.user_item_id}">{equipment_types.items.item_name}</option>
		<!-- END items -->
	</select>
</div>
<!-- END equipment_types -->

<!-- IF owner -->
<button class="btn btn-lg btn-primary btn-block btn-equip">[[of:equip]]</button>
<!-- IF owner -->


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .equipment').addClass('active');
	});
</script>