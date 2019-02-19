<?php
//print_r($results);
?>
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