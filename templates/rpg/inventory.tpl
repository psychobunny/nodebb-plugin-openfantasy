<div class="row">
	<!-- IF !items.length -->
	<div class="alert alert-info">[[of:items_none]]</div>
	<!-- ENDIF !items.length -->
	<!-- BEGIN items -->
	<div class="col-xs-3">
		<div class="well text-center">
			<img class="img-thumbnail" src="{items.item_icon}" /><br />
			<p style="height: 100px;">
				<strong>[[{items.item_name}]]</strong><br />
				<small>[[{items.item_desc}]]</small>
			</p>
			<button class="btn btn-danger btn-delete btn-sm form-control" data-uiid="{items.user_item_id}">[[of:Dispose]]</button>
		</div>
	</div>
	<!-- END items -->
</div>

<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .inventory').addClass('active');
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