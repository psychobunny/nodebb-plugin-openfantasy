<ul class="nav nav-pills">
	<li class="active">
		<a href="/rpg/shops">[[of:forum_shops_go]]</a>
	</li>
	<li>
		<a href="#">[[of:users_shops_list]]</a>
	</li>
	<li>
		<a href="#">[[of:items_search]]</a>
	</li>
	<!-- IF shop -->
	<li>
		<a href="#">[[of:users_shops_manage]]</a>
	</li>
	<!-- ELSE -->
	<li>
		<a href="#">[[of:users_shops_create]]</a>
	</li>
	<!-- ENDIF shop -->
</ul>

<br />
<div class="well">
You have <strong>{character_points}</strong> {l_points}.
</div>

<!-- IF in_battle -->
<div class="alert alert-danger">[[of:battle_progress]]</div>
<!-- ENDIF in_battle -->

<!-- IF view_store_list -->
<table width="100%" cellpadding="3" cellspacing="1" border="0" class="table">
	<tr> 
		<th width="10%">[[of:store_img]]</th>
		<th width="20%">[[of:store_name]]</th>
		<th width="50%">[[of:store_desc]]</th>
		<th width="20%">[[of:store_status]]</th>
	</tr>

	<!-- BEGIN store -->
		<tr height="30"> 
			<td class="{store.row_class}"><span class="nav">{store.store_img}</span></a></td>
			<td class="{store.row_class}"><a href="./shops/store/{store.store_id}"><span class="nav">{store.store_name}</span></a></td>
			<td class="{store.row_class}"><span class="gen"><i>{store.store_desc}</i></span></td>
			<td class="{store.row_class}"><span class="gen">{store.store_status}</span></td>
		</tr>
	<!-- END store -->
	<tr> 
		<td class="catBottom" colspan="4" height="28">&nbsp;</td>
	</tr>
</table>

<!-- ENDIF view_store_list -->




<!-- IF view_store -->
<div class="row">
	<!-- BEGIN items -->
	<div class="col-xs-3">
		<div class="well text-center item-card">
			<img class="img-thumbnail" src="{items.item_icon}" /><br />
			<p>
				<div class="front">
					<strong>{items.item_name}</strong><br />
					<small>{items.item_desc}</small>
				</div>
				<div class="back">
					<strong>{items.item_name}</strong><br />
					<small><strong>{items.item_power}</strong> [[of:power]]</small><br />
					<small><strong>{items.item_quality}</strong> [[of:quality]]</small><br />
					<small><strong>{items.item_duration}/{items.item_duration_max}</strong> [[of:duration]]</small>
				</div>
			</p>
			<button class="btn btn-primary btn-buy btn-sm form-control" data-price="{items.item_price}" data-id="{items.item_id}">Buy for {items.item_price} {l_points}</button>
		</div>
	</div>
	<!-- END items -->
</div>
<!-- ENDIF view_store -->






<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .shops').addClass('active');
	});

	$('.item-card').on('mouseover', function() {
		$(this).addClass('flipped');
	}).on('mouseout', function() {
		$(this).removeClass('flipped');
	});

	$('.btn-buy').on('click', function() {
		var btn = $(this),
			price = parseInt(btn.attr('data-price'), 10),
			itemID = btn.attr('data-id');

		if (price > openfantasy.cash.points) {
			app.alertError('[[of:lack_points]]');
		} else {
			$.post('/api/openfantasy/shops/buy', {
				_csrf: config.csrf_token,
				itemID: itemID
			}, function(result) {
				app['alert' + (!!result.status ? 'Success' : 'Error')](result.message);
				openfantasy.refreshCash();
			});
		}
	});
</script>