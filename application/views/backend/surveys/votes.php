<?php
//print_r($results);
?>
<div class="row">
	<div class='col-xs-6'>
		<?php echo form_open(base_url() . 'surveys/votes/', array('id'=> 'frm_edit_grouping',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
	     <div class='form-group'>
	     	<label class='col-xs-4 control-label'><?=get_phrase("select_survey_period");?></label>
	     	<div class="col-xs-6">
	     		<select class='form-control' name='survey_id'>
	     			<option value=''><?=get_phrase('select_survey_period');?></option>
	     			<?php
	     			foreach ($all_surveys as $survey) {
					 ?> 
					 <option value='<?=$survey->survey_id;?>' <?php if($selected_survey_id==$survey->survey_id) echo 'selected'; ?>><?=date('jS F Y',strtotime($survey->start_date)).' - '.date('jS F Y',strtotime($survey->end_date));?></option>	
					<?php
					 }
	     			?>
	     		</select>
	     	</div>
	     	<div class='col-xs-2'>
	     		<button type='submit' class='btn btn-success'><?=get_phrase('go')?></button>
	     	</div>
	     </div>
	 	</form>
	</div>
	
</div>
<hr />
<div class="row">
	<div class="col-sm-12">
		<table class="table table-striped datatable">
			<thead>
				<tr>
					<th rowspan="2"><?=get_phrase('country')?></th>
					<th colspan="3"><?=get_phrase('votes');?></th>
				</tr>
				<tr>
					<th><?=get_phrase('active');?></th>
					<th><?=get_phrase('submitted');?></th>
					<th><?=get_phrase('total');?></th>
				</tr>
			</thead>
			<tbody>
				<?php
					$grand_total = 0;
					$grand_active = 0;
					$grand_submitted = 0;
					foreach($results as $country=>$votes){
				?>
					<tr>
						<td><?=$country;?></td>
						<?php
							$active = isset($results[$country]['active'])?$results[$country]['active']:0;
							$submitted = isset($results[$country]['submitted'])?$results[$country]['submitted']:0;
							$total = $active + $submitted;
						?>
						<td><?=$active;?></td>
						<td><?=$submitted;?></td>
						<td><?=$total;?></td>
					</tr>
				<?php
						$grand_active += $active;
						$grand_submitted += $submitted;
						$grand_total += $total;
					}
				?>
			</tbody>
			<tfoot>
				<tr>
					<td><?=get_phrase('total');?></td>
					<td><?=$grand_active;?></td>
					<td><?=$grand_submitted;?></td>
					<td><?=$grand_total;?></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<script>
		$(".datatable").DataTable(
		{
			dom: 'lBfrtip',
			buttons: [
            	'copy', 'csv', 'excel', 'pdf', 'print'//Use this to spedify the button to see or leave it to have all buttons
        	],
			"ordering": false,
		    "stateSave": true,
		    "scrollX": false
		 }
	);
	
});
</script>