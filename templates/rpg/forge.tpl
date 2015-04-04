<table border="2" align="center" class="table" width="80%" >
	<tr>
		<td align="center" class="CatHead" colspan="2"><b>[[of:forge_repair]]</b></td>
	</tr>
	<tr>
		<td align="center" class="row1" >[[of:forge_mining_select_tool]]</td>
		<td align="center" class="row2" >
			<select name="tool" class="form-control">
				<!-- BEGIN tool -->
				<option value="{tool.user_item_id}">{tool.item_name}</option>
				<!-- END tool -->
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" class="row1" >[[of:forge_repair_select_item]]</td>
		<td align="center" class="row2" >
			<select name="tool" class="form-control">
				<!-- BEGIN items -->
				<option value="{items.user_item_id}">{items.item_name}</option>
				<!-- END items -->
			</select>
		</td>
	</tr>
</table>
<div style="height: 75px;">
	<div class="progress progress-striped active hide" style="height: 35px">
	  <div class="progress-bar progress-bar-warning"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
	</div>
	<div class="alert alert-info message">
		[[of:forge_repair_explain]]
	</div>
</div>
<button class="btn btn-primary btn-block btn-go">[[of:forge_repair_go]]</button>


<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .forge').addClass('active');
	});
</script>