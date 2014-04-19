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
			<button class="btn btn-danger btn-buy btn-sm form-control" data-id="{items.item_id}">[[of:Dispose]]</button>
		</div>
	</div>
	<!-- END items -->
</div>

<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .inventory').addClass('active');
	});
</script>