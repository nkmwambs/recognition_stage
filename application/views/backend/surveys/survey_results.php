<?php
//print_r($results);
?>
<div class="row">
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-book"></i>
					<?php echo get_phrase('survey_results');?>: 
            	</div>
            </div>
			<div class="panel-body">
				<table class="table table-striped" id="table_export">
					<thead>
						<tr>
							<th><?=get_phrase("voter_staff_number");?></th>
							<th><?=get_phrase("voting_staff");?></th>
							<th><?=get_phrase("country");?></th>
							<th><?=get_phrase("vote_status");?></th>
							<th><?=get_phrase("voting_start_date");?></th>
							<th><?=get_phrase("voting_end_date");?></th>
							<th><?=get_phrase("category");?></th>
							<th><?=get_phrase("nomination_type");?></th>
							<th><?=get_phrase("voting_unit");?></th>
							<th><?=get_phrase("nominee");?></th>
							<th><?=get_phrase("comment");?></th>
							
						</tr>
					</thead>
					
					<tbody>
						<?php 
							if(count($results) > 0){
							foreach($results as $result){
						?>
							<tr>
								<td><?=$this->db->get_where("user",array("user_id"=>$result->user_id))->row()->employee_id;?></td>
								<td><?php $user = $this->db->get_where("user",array("user_id"=>$result->user_id))->row(); echo $user->firstname.' '.$user->lastname;?></td>
								<td><?=$this->crud_model->get_type_name_by_id("country",$user->country_id);?></td>
								<td><?=$result->status === '0' ? get_phrase("in_progress"):get_phrase("completed");?></td>
								<td><?=$result->created_date;?></td>
								<td><?=$result->last_modified_date;?></td>
								<td><?=$this->crud_model->get_type_name_by_id("category",$result->category_id);?></td>
								<td><?php $category = $this->db->get_where("category",array("category_id"=>$result->category_id))->row(); echo $this->crud_model->get_type_name_by_id("contribution",$category->assignment);?></td>
								<td><?=$unit = $this->crud_model->get_type_name_by_id("unit",$category->unit)?></td>
								<td>
									<?php
										 if($unit === "user") {
										 	$nominee = $this->db->get_where("user",array("user_id"=>$result->nominee_id))->row(); echo $nominee->firstname.' '.$nominee->lastname;
										 }else{
										 	echo $this->db->get_where($unit,array($unit.'_id'=>$result->nominee_id))->row()->name;
										 }	
									?>
								</td>
								<td><?=$this->db->get_where("tabulate",array("category_id"=>$result->category_id,"result_id"=>$result->result_id))->row()->comment;?></td>
							</tr>
				
						<?php 
							}
							}else{
						?>	
							<tr><td colspan="10"><?=get_phrase("no_data_found");?></td></tr>		
						<?php		
							}	
						?>			
					</tbody>
				</table>
				
			
			</div>
		</div>
	</div>
</div>		

<script>
	$(document).ready(function(){
		//var datatable = $('.table').DataTable();
		
		
		    if (location.hash) {
			        $("a[href='" + location.hash + "']").tab("show");
			    }
			    $(document.body).on("click", "a[data-toggle]", function(event) {
			        location.hash = this.getAttribute("href");
			    });
		
			$(window).on("popstate", function() {
			    var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
			    $("a[href='" + anchor + "']").tab("show");
		
		});
		
		
		
		var datatable = $('#table_export').DataTable({
		       dom: '<Bf><"col-sm-12"rt><ip>',
		       pagingType: "full_numbers",
		       buttons: [
		           'csv', 'excel', 'print'
		       ],
		       stateSave: true,
		           
		   });
		   
		   
	   
	});
	
</script>