<!-- IF in_battle -->
	<div class="alert alert-danger">[[of:battle_progress]]</div>
<!-- ELSE -->
	<!-- IF owner -->
	<h3>[[of:equip_title]]</h3>
	<!-- ENDIF owner -->

	<form id="equipment">
		<!-- BEGIN equipment_types -->
		<div class="well">
			<h4>{equipment_types.item_type_name}</h4>
			<select class="form-control" name="{equipment_types.item_type_id}">
				<!-- BEGIN items -->
				<option value="{equipment_types.items.user_item_id}" <!-- IF equipment_types.items.equipped -->selected<!-- ENDIF equipment_types.items.equipped -->>
					{equipment_types.items.item_name}
				</option>
				<!-- END items -->
			</select>
		</div>
		<!-- END equipment_types -->
	</form>

	<!-- IF owner -->
	<button class="btn btn-lg btn-primary btn-block btn-equip">[[of:equip]]</button>
	<!-- ENDIF owner -->
<!-- ENDIF in_battle -->

<script type="text/javascript">
	$('.btn-equip').on('click', function(err) {
		$.post('/api/openfantasy/equipment/equip', {
			_csrf: config.csrf_token,
			equipment: $('#equipment').serializeArray()
		}, function(result) {
			app['alert' + (!!result.status ? 'Success' : 'Error')](result.message);
		});
	});

	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .equipment').addClass('active');
	});
</script>