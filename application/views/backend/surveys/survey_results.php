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
				<form action="<?=base_url();?>surveys/survey_results/<?=$results[0]->survey_id;?>/search" method="POST">
					
				<div class="row">
					<div class="col-sm-2">
						<span><?=get_phrase("select_country");?></span>
					</div>
					<div class="col-sm-8">
						<select class="form-control" id="" name="country_id">
							<option value=""><?=get_phrase("select");?></option>
							<?php
								$this->db->where($this->crud_model->country_scope_where($this->session->login_user_id));
								$countries = $this->db->get("country");
								if($countries->num_rows() > 0 ){
									foreach($countries->result_object() as $country){
							?>
									<option value="<?=$country->country_id;?>"><?=$country->name;?></option>	
							<?php
									}
								}
							?>
						</select>
					</div>
					
					<div class="col-sm-2">
						<button type="submit" class="btn btn-default"><?=get_phrase('search');?></button>
					</div>
				</div>
				
				</form>
				
				<hr />
				
				<table class="table table-striped" id="table_export">
					<thead>
						<tr>
							<!-- <th><?=get_phrase("voter_staff_number");?></th>
							<th><?=get_phrase("voting_staff");?></th> -->
							<th><?=get_phrase("voting_staff_country");?></th>
							<th><?=get_phrase("vote_status");?></th>
							<th><?=get_phrase("voting_start_date");?></th>
							<th><?=get_phrase("voting_end_date");?></th>
							<th><?=get_phrase("category");?></th>
							<th><?=get_phrase("nomination_type");?></th>
							<th><?=get_phrase("voting_unit");?></th>
							<th><?=get_phrase("nominee");?></th>
							<th><?=get_phrase("nominee_country");?></th>
							<th><?=get_phrase("comment");?></th>
							
						</tr>
					</thead>
					
					<tbody>
						<?php 
							if(count($results) > 0){
							foreach($results as $result){
								
						?>
							<tr>
								<!-- <td><?=$this->db->get_where("user",array("user_id"=>$result->user_id))->row()->employee_id;?></td>
								<td><?php $user = $this->db->get_where("user",array("user_id"=>$result->user_id))->row(); echo $user->firstname.' '.$user->lastname;?></td> -->
								<td><?=$this->crud_model->get_type_name_by_id("country",$user->country_id);?></td>
								<td><?=$result->status === '0' ? get_phrase("in_progress"):get_phrase("completed");?></td>
								<td><?=$result->created_date;?></td>
								<td><?=$result->last_modified_date;?></td>
								<td><?=$this->crud_model->get_type_name_by_id("category",$result->category_id);?></td>
								<td><?php $category = $this->db->get_where("category",array("category_id"=>$result->category_id))->row(); echo $this->crud_model->get_type_name_by_id("contribution",$category->assignment);?></td>
								<td><?=$unit = $this->crud_model->get_type_name_by_id("unit",$category->unit)?></td>
								
									<?php
										$nominee_name = get_phrase("no_viable_option");
										$nominee_country = $this->crud_model->get_type_name_by_id("country",$user->country_id);
											
										if($result->nominee_id > 0){
											$nominee_name = "";
											$nominee_country = $this->crud_model->get_type_name_by_id("country",$user->country_id);
											 if($unit === "user") {
											 	$nominee = $this->db->get_where("user",array("user_id"=>$result->nominee_id))->row(); 
											 	$nominee_name = $nominee->firstname.' '.$nominee->lastname;
												$nominee_country = $this->db->get_where("country",array("country_id"=>$nominee->country_id))->row()->name;
											 	
											 }else{
											 	 $nominee_name = $this->db->get_where($unit,array($unit.'_id'=>$result->nominee_id))->row()->name;
											 }		
										}
										
									?>
								
								<td><?=$nominee_name;?></td>
								<td><?=$nominee_country;?></td>
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