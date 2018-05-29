<?php
$grouping = $this->db->get_where("grouping",array("grouping_id"=>$param2))->row();
?>
<div class="row">
	<div class="col-md-12 inner-progress"></div>
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-eye"></i>
					<?php echo get_phrase('category_group');?> : <?=$this->crud_model->get_results_by_related_id("grouping","grouping_id",$param2)->name;?> 
            	</div>
            </div>
			<div class="panel-body">
				<table class="table">
					<thead></thead>
					<tbody>
					<tr>
						<td><?=get_phrase("status");?></td>
						<td><?=$grouping->status="1"? get_phrase("active"):get_phrase("inactive");?></td>
					</tr>
					
					<tr>
						<td><?=get_phrase("title");?></td>
						<td><?=$grouping->name;?></td>
					</tr>
					
					
					<tr>
						<td><?=get_phrase("description");?></td>
						<td><?=$grouping->description;?></td>
					</tr>
					
					
					<tr>
						<td><?=get_phrase("created_by");?></td>
						<td><?=$this->crud_model->get_type_name_by_id("user",$grouping->created_by,"firstname");?></td>
					</tr>
										
					<tr>
						<td><?=get_phrase("created_date");?></td>
						<td><?=$grouping->created_date;?></td>
					</tr>
					
					<tr>
						<td><?=get_phrase("last_modified_by");?></td>
						<td><?=$this->crud_model->get_type_name_by_id("user",$grouping->last_modified_by,"firstname");?></td>
					</tr>
					
					<tr>
						<td><?=get_phrase("last_modified");?></td>
						<td><?=$grouping->last_modified;?></td>
					</tr>
					
					
					</tbody>
				</table>	
			</div>
		</div>
	</div>
</div>				