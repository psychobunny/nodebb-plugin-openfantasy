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
		<div class="well text-center">
			<img class="img-thumbnail" src="{items.item_icon}" /><br />
			<p style="height: 100px;">
				<strong>[[{items.item_name}]]</strong><br />
				<small>[[{items.item_desc}]]</small>
			</p>
			<button class="btn btn-primary form-control">Buy for {items.item_price} gp</button>
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
</script>