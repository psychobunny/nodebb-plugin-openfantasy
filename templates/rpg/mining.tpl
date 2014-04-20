<table border="1" align="center" class="table" width="80%" >
	<tr>
		<td align="center" class="CatHead" colspan="2"><b>[[of:mining]]</b></td>
	</tr>
	<tr>
		<td align="center" class="row1" >[[of:forge_mining_select_tool]]</td>
		<td align="center" class="row2" >
			<select name="item" class="form-control">
				<!-- BEGIN item -->
				<option value="{item.user_item_id}">{item.item_name}</option>
				<!-- END item -->
			</select>
		</td>
	</tr>
</table>
<div style="height: 75px;">
	<div class="progress hide" style="height: 35px">
	  <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
	</div>
	<div class="alert alert-info message">
		[[of:forge_mining_explain]]
	</div>
</div>
<button class="btn btn-primary btn-block btn-go">[[of:forge_mining_go]]</button>


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
		}, cooldown + 750);
	});

	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .mining').addClass('active');
	});
</script>