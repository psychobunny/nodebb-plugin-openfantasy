<table border="1" align="center" class="table" width="80%" >
	<tr>
		<td align="center" class="CatHead" colspan="2"><b>[[of:forge_enchant]]</b></td>
	</tr>
	<tr>
		<td align="center" class="row1" >[[of:forge_enchant_select_tool]]</td>
		<td align="center" class="row2" >
			<select name="tool" class="form-control">
				<!-- BEGIN tool -->
				<option value="{tool.user_item_id}">{tool.item_name}</option>
				<!-- END tool -->
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" class="row1" >[[of:forge_enchant_select_item]]</td>
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
		[[of:forge_enchant_explain]]
	</div>
</div>
<button class="btn btn-primary btn-block btn-go">[[of:forge_enchant_go]]</button>


<script type="text/javascript">
	$('.btn-go').on('click', function() {
		var btn = $(this),
			progress = $('.progress'),
			bar = progress.children('.progress-bar'),
			message = $('.message');

		btn.prop('disabled', true);
		progress.removeClass('hide');
		message.addClass('hide');
		
		var cooldown = 5000; // pull this from server

		var parts = Math.floor(Math.random() * 4) + 3,
			interval = Math.ceil(cooldown / parts),
			partsWidth = Math.ceil(100 / parts)
			total = 0;

		while (parts--) {
			total += interval;
			setTimeout(function() {
				bar.css('width', (parseInt(bar[0].style.width, 10) + parseInt(partsWidth, 10)) + '%');
			}, total);
		}

		setTimeout(function() {
			btn.prop('disabled', false);
			progress.addClass('hide');
			bar.css('width', '0%');
			$('.message').html('Success! You found a rock.').removeClass('hide');
		}, cooldown + 1000);
	});

	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .mining').addClass('active');
	});
</script>

<script type="text/javascript">
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .enchant').addClass('active');
	});
</script>