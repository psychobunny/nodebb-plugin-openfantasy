<div class="row inventory">
	<!-- IF !items.length -->
	<div class="alert alert-info">[[of:items_none]]</div>
	<!-- ENDIF !items.length -->
	<!-- BEGIN items -->
	<div class="col-xs-3">
		<div class="well text-center item-card" data-equipped="{items.equipped}">
			<img class="img-thumbnail" src="{items.item_icon}" /><br />
			<p>
				<div class="back">
					<p><button class="btn btn-danger btn-delete btn-xs form-control" data-uiid="{items.user_item_id}">
						[[of:Dispose]]
					</button></p>
					<p><button class="btn btn-success btn-sell btn-xs form-control" data-uiid="{items.user_item_id}">
						[[of:items_sell]]
					</button></p>
					<p><button class="btn btn-info btn-warehouse btn-xs form-control" data-uiid="{items.user_item_id}">
						[[of:items_into_warehouse]]
					</button></p>
				</div>
				<div class="front">
					<strong>{items.item_name}</strong><br />
					<small><strong>{items.item_power}</strong> [[of:power]]</small><br />
					<small><strong>{items.item_quality}</strong> [[of:quality]]</small><br />
					<small><strong>{items.item_duration}/{items.item_duration_max}</strong> [[of:duration]]</small>
					<br /><br />
					<button class="btn btn-info btn-delete btn-xs form-control" data-uiid="{items.user_item_id}" <!-- IF items.equipped -->disabled<!-- ENDIF items.equipped -->>
						<!-- IF items.equipped -->[[of:equip_equipped]]<!-- ELSE -->[[of:items_action]]<!-- ENDIF items.equipped -->
					</button>
				</div>
			</p>
			
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
		var $this = $(this);
		if ($this.attr('data-equipped') === 'false') {
			$this.addClass('flipped');
		}
	}).on('mouseout', function() {
		$(this).removeClass('flipped');
	});

	$('.btn-delete').on('click', function(err) {
		var userItemID = $(this).attr('data-uiid');

		bootbox.confirm('[[of:shop_items_confirm_delete]]', function(confirm) {
			if (confirm) {
				$.post('/api/openfantasy/inventory/delete', {
					_csrf: config.csrf_token,
					userItemID: userItemID
				}, function(result) {
					app['alert' + (!!result.status ? 'Success' : 'Error')](result.message);
					ajaxify.refresh();
				});
			}
		});
	});

	$('.btn-warehouse').on('click', function(err) {
		bootbox.alert('[[of:lack_warehouse]]');
	});

	$('.btn-sell').on('click', function(err) {
		bootbox.alert('[[of:lack_shops]]');
	});
</script>