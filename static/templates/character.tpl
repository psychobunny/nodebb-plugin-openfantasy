<!-- IF nocharacter -->
<h3>Create a character</h3>
<div class="row create-character">
	<div class="col-lg-9">
		<div class="well">
			<form role="form">
				<div class="form-group">
					<label for="character_name">Character Name</label>
					<input type="email" class="form-control" id="character_name" placeholder="Enter your name...">
				</div>
				<div class="form-group">
					<label for="character_race">Character Race</label>
					<select class="form-control" id="character_race">
						<!-- BEGIN races -->
						<option value="{races.race_id}" data-desc="[[{races.race_desc}]]">[[{races.race_name}]]</option>
						<!-- END races -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_class">Character Class</label>
					<select class="form-control" id="character_class">
						<!-- BEGIN classes -->
						<option value="{classes.class_id}" data-desc="[[{classes.class_desc}]]">[[{classes.class_name}]]</option>
						<!-- END classes -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_element">Select an Element</label>
					<select class="form-control" id="character_element">
						<!-- BEGIN elements -->
						<option value="{elements.element_id}" data-desc="[[{elements.element_desc}]]">[[{elements.element_name}]]</option>
						<!-- END elements -->
					</select>
				</div>
				<div class="form-group">
					<label for="character_alignment">Select an Alignment</label>
					<select class="form-control" id="character_alignment">
						<!-- BEGIN alignments -->
						<option value="{alignments.alignment_id}" data-desc="[[{alignments.alignment_desc}]]">[[{alignments.alignment_name}]]</option>
						<!-- END alignments -->
					</select>
				</div>
				<button type="button" class="btn btn-primary btn-lg btn-block">Create Character</button>
			</form>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="alert alert-info details">
			Create a character
		</div>
	</div>
</div>

<script type="text/javascript">
$('document').ready(function() {
	$('.create-character [data-desc]').on('mouseover', function() {
		$('.details').html(this.getAttribute('data-desc'));
	})
});
</script>
<!-- ENDIF nocharacter -->



