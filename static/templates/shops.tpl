<nav class="navbar navbar-default" role="navigation">
	<ul class="nav navbar-nav">
		<li class="active">
			<a href="#">[[of:forum_shops_go]]</a>
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
</nav>



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
			<td class="{store.row_class}" onclick="window.location.href='{store.u_store_name}';"><span class="nav">{store.store_img}</span></a></td>
			<td class="{store.row_class}" onclick="window.location.href='{store.u_store_name}';"><a href="./shops/store/{store.store_id}"><span class="nav">{store.store_name}</span></a></td>
			<td class="{store.row_class}" onclick="window.location.href='{store.u_store_name}';"><span class="gen"><i>{store.store_desc}</i></span></td>
			<td class="{store.row_class}" onclick="window.location.href='{store.u_store_name}';"><span class="gen">{store.store_status}</span></td>
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


<table class="table" width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
   <tr>
      <td align="left" nowrap="nowrap" width="50%"><span class="gensmall"><b>{L_POINTS}</b>: {POINTS}</span></td>
      <td align="right" nowrap="nowrap" width="50%"><span class="gensmall"><a href="{SHOW_LINK}">{L_SHOW_LINK}</a></span></td>
   </tr>
</table>
<br />

<table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
	<tr>
		<th align="center">&nbsp;</th>
		<th align="center">{L_ITEM_NAME}:</th>
		<th align="left">{L_ITEM_DESC}:</th>
		<th align="center">{L_ITEM_PRICE}:</th>
		<th align="center">{L_ITEM_QUALITY}:</th>
		<th align="center">{L_ITEM_POWER}:</th>
		<th align="center">{L_ITEM_WEIGHT}:</th>
		<th align="center">{L_ITEM_DURATION}:</th>
		<th align="center">{L_ITEM_TYPE}:</th>
	</tr>
	<!-- BEGIN asd -->
	<tr height="30">
		<td class="{view_store.items.ROW_CLASS}" align="center">
			<input type="hidden" name="shop_owner_id" value="{SHOP_OWNER_ID}" />
			<input type="hidden" name="store_id" value="{view_store.items.ITEM_STORE_ID}" />
			<input type="checkbox" name="item_box[]" value="{view_store.items.ITEM_ID}" />
		</td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><img style="border:0" src="./adr/images/items/{view_store.items.ITEM_IMG}"></a><br /><a href="{view_store.items.U_ITEM_INFO}"><span class="nav"><span class="gen"><b>{view_store.items.ITEM_NAME}</b></span></a></td>
		<td class="{view_store.items.ROW_CLASS}" align="left" valign="top">
			<br><span class="gensmall"><i>{view_store.items.ITEM_DESC}</i><br>
        	<!-- BEGIN crit_hit -->
			<br><b>{view_store.items.crit_hit.L_CRIT_HIT}:</b>&nbsp;{view_store.items.crit_hit.CRIT_HIT}</b>
			<!-- END crit_hit -->
			<!-- BEGIN resist_chars -->
			<br><b>{view_store.items.resist_chars.L_CHAR_RESIST_LIST}:</b>&nbsp;{view_store.items.resist_chars.CHAR_RESIST_LIST}
			<!-- END resist_chars -->
        	<!-- BEGIN align_restrict -->
			<br /><b>{view_store.items.align_restrict.L_ALIGN_LIST}:</b> {view_store.items.align_restrict.ALIGN_LIST}
			<!-- END align_restrict -->
        	<!-- BEGIN class_restrict -->
			<br /><b>{view_store.items.class_restrict.L_CLASS_LIST}:</b> {view_store.items.class_restrict.CLASS_LIST}
			<!-- END class_restrict -->
        	<!-- BEGIN element_restrict -->
			<br /><b>{view_store.items.element_restrict.L_ELEMENT_LIST}:</b> {view_store.items.element_restrict.ELEMENT_LIST}
			<!-- END element_restrict -->
        	<!-- BEGIN race_restrict -->
			<br /><b>{view_store.items.race_restrict.L_RACE_LIST}:</b> {view_store.items.race_restrict.RACE_LIST}
			<!-- END race_restrict -->
        	<!-- BEGIN steal_show -->
			<br /><b>{view_store.items.steal_show.L_STEAL_SHOW}</b>&nbsp;<i>{view_store.items.steal_show.STEAL_SHOW}</i></b>
			<!-- END steal_show -->
			</span>
		</td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><span class="gensmall">{view_store.items.ITEM_PRICE}</span></td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><span class="gensmall">{view_store.items.ITEM_QUALITY}</span></td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><span class="gensmall">{view_store.items.ITEM_POWER}</span></td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><span class="gensmall">{view_store.items.ITEM_WEIGHT}</span></td>
		<td class="{view_store.items.ROW_CLASS}" align="center" nowrap="nowrap"><span class="gensmall">{view_store.items.ITEM_DURATION} / {view_store.items.ITEM_DURATION_MAX}</span></td>
		<td class="{view_store.items.ROW_CLASS}" align="center"><span class="gensmall">{view_store.items.ITEM_TYPE}</span></td>
	</tr>
	<!-- END asd -->
	<tr>
		<td class="catBottom" colspan="10" height="28" align="left">
	   	<!-- IF forum_shops -->
		<span class="gen">{L_SELECT_QUANTITY}&nbsp;&nbsp;</span>{SELECT_QUANTITY}&nbsp;&nbsp;
		<!-- ENDIF forum_shops -->
		{ACTION_SELECT}&nbsp;<input type="submit" value="{L_SUBMIT}" class="mainoption" /></td>
	</tr>
</table>

<table width="100%" cellspacing="2" border="0" align="center" cellpadding="2">
	<tr> 
		<td align="right" valign="top"></td>
	</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr> 
		<td><span class="nav">{PAGE_NUMBER}</span></td>
		<td align="right"><span class="gensmall"><span class="nav">{PAGINATION}</span></td>
	</tr>
</table>
<!-- ENDIF view_store -->






<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .shops').addClass('active');
	});
</script>