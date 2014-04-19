<table class="table" cellspacing="1" cellpadding="4" border="0" align="center" width="100%">
	<!-- BEGIN equipment_types -->
	<tr>
		<td align="center" class="row1">
			[[of:select_{equipment_types.name}]]<br />
			<select class="form-control">
				<!-- BEGIN equipment_types.items -->
				<option value="{equipment_types.items.user_item_id}">{equipment_types.item_name}</option>
				<!-- END equipment_types.items -->
			</select>
		</td>
	</tr>
	<!-- END equipment_types -->

	<!-- BEGIN owner -->
	<tr> 
		<td align="center" class="catBottom"><input type="submit" value="[[of:equip]]" name="equip" class="liteoption" /></span></td>
	</tr>
	<!-- END owner -->
</table>


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .equipment').addClass('active');
	});
</script>