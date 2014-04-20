<div class="row">
	<!-- IF !items.length -->
	<div class="alert alert-info">[[of:items_none]]</div>
	<!-- ENDIF !items.length -->
	<!-- BEGIN items -->
	<div class="col-xs-3">
		<div class="well text-center item-card">
			<img class="img-thumbnail" src="{items.item_icon}" /><br />
			<p>
				<div class="back">
					<strong>{items.item_name}</strong><br />
					<small>{items.item_desc}</small>
				</div>
				<div class="front">
					<strong>{items.item_name}</strong><br />
					<small><strong>{items.item_power}</strong> [[of:power]]</small><br />
					<small><strong>{items.item_quality}</strong> [[of:quality]]</small><br />
					<small><strong>{items.item_duration}/{items.item_duration_max}</strong> [[of:duration]]</small>
				</div>
			</p>
			<button class="btn btn-danger btn-delete btn-sm form-control" data-uiid="{items.user_item_id}" <!-- IF items.equipped -->disabled<!-- ENDIF items.equipped -->>
				<!-- IF items.equipped -->[[of:equip_equipped]]<!-- ELSE -->[[of:Dispose]]<!-- ENDIF items.equipped -->
			</button>
		</div>
	</div>
	<!-- END items -->
</div>

<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .inventory').addClass('active');
	});

	$('.item-card').on('mouseover', function() {
		$(this).addClass('flipped');
	}).on('mouseout', function() {
		$(this).removeClass('flipped');
	});

	$('.btn-delete').on('click', function(err) {
		var userItemID = $(this).attr('data-uiid');

		bootbox.confirm('[[of:shop_items_confirm_delete]]', function(confirm) {
			$.post('/api/openfantasy/inventory/delete', {
				_csrf: $('#csrf_token').val(),
				userItemID: userItemID
			}, function(result) {
				app['alert' + (!!result.status ? 'Success' : 'Error')](result.message);
				ajaxify.refresh();
			});
		});
	});
</script>