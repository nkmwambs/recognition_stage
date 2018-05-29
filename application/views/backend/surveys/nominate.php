<?php

//print_r($user_scope);
?>
<div class="row">

	<div class="col-sm-8">
		<?php 
		
			/** Check if an active survey exists. If no show the message there is no active survey or else check if a vote has been initiated**/
			
			$active_survey = $this->db->get_where("survey",array("status"=>"1"));
			
			if($active_survey->num_rows() === 0){
		?>		
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
					<div class="well"><?=get_phrase("there_is_no_active_survey");?></div>
				</div>
			</div>		
		<?php
			}else{
				
				/** Check if a vote has been initiated for the current active survey. If no, show the start voting button **/
				
				$survey_result = $this->db->get_where("result",array("user_id"=>$this->session->login_user_id,"survey_id"=>$active_survey->row()->survey_id));
				
				if($survey_result->num_rows() === 0){
		?>	
				<div class="row">
					<div class="col-sm-12" style="text-align: center;">
						<a href="<?=base_url();?>surveys/nominate/start_nomination/<?=$this->session->login_user_id;?>" class="btn btn-danger btn-icon"><i class="fa fa-hourglass-start"></i><?=get_phrase("start_voting");?></a>
					</div>	
				</div>		
		<?php		
				}else{
					
				/** Check if a vote has not been submitted **/	
					
				$survey_result_voted = $this->db->get_where("result",array("user_id"=>$this->session->login_user_id,"survey_id"=>$active_survey->row()->survey_id,"status"=>'0'));
				
				if($survey_result_voted->num_rows() === 0 ){
		?>
				<div class="row">
					<div class="col-sm-12" style="text-align: center;">
						<div class="well"><?=get_phrase("you_have_already_participated_in_voting");?></div>
					</div>
				</div>	
		<?php			
				}else{	
		?>
		
			<!-- Show nomination table if a vote has not been submitted -->
	
					<table class="table">
						<thead>
							
						</thead>
						<tbody>
							<?php foreach($groupings as $grouping){?>
									<tr>
										<td colspan="5" style="background-color:#F5F5F5;font-weight: bolder;text-align: center;"><?=$grouping->name;?></td>
									</tr>
									<tr style="font-style: italic;">
										<td><?=get_phrase("category");?></td>
										<td><?=get_phrase("assignment");?></td>
										<td><?=get_phrase("visibility");?></td>
										<td><?=get_phrase("unit");?></td>
										<td><?=get_phrase("nominate_unit");?></td>
									</tr>
									
									<?php 
										$this->db->where(array("grouping_id"=>$grouping->grouping_id));
										$this->db->where(array("status"=>"1"));
										if($contribution === "1"){
											$this->db->where(array("assignment"=>$contribution));
										}
										
		
										$categories = $this->db->get("category")->result_object();
										
										foreach($categories as $category){
											$unit_table_name = $this->db->get_where("unit",array("unit_id"=>$category->unit))->row()->name;
													
											$units = $this->db->get($unit_table_name)->result_object();
									?>
										<tr>
											<td><?=$category->name;?></td>
											<td><?=$this->crud_model->get_type_name_by_id("contribution",$category->assignment);?></td>
											<td><?=$this->crud_model->get_type_name_by_id("country",$category->visibility);?></td>
											<td><?=ucfirst($unit_table_name);?></td>
											<td>
													<select class="form-control select2">
														<option><?=get_phrase('nominate');?></option>
														<?php foreach($units as $unit){
															if($unit_table_name == 'user'){
														?>
															<option value=""><?=$unit->firstname;?> <?=$unit->lastname;?></option>
														<?php		
															}else{
																
														?>
															<option value=""><?=$unit->name;?></option>
														<?php		
															}	
														?>
															
														<?php }?>	
													</select>
												
											</td>
										</tr>
									<?php }?>
									
							<?php }?>
							
							<tr>
								<td colspan="5" style="text-align: center;"><a href="<?=base_url();?>surveys/nominate/submit_vote/<?=$this->session->login_user_id;?>" class="btn btn-success btn-icon"><i class="fa fa-star"></i><?=get_phrase("submit");?></a></td>
							</tr>
						</tbody>
					</table>
		<?php
				}
			}
		}
		?>
	</div>
	
	
	
	<div class="col-sm-4">
		<div class="row">
			<div style="text-align: center;font-style: italic;font-weight: bold;" class="col-sm-12"><?=get_phrase("your_voting_privileges");?></div>
		</div>
		<hr/>
		<div class="row">
			<div style="text-decoration: underline;font-weight: bold;" class="col-sm-12"><?=get_phrase("contribution");?>:</div>
			
			
			<div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("role");?>:</span> <?=$role->name;?></div>
			<div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("position");?>:</span> <?=$this->db->get_where("contribution",array("contribution_id"=>$role->contribution))->row()->name;?></div>
		</div>
		<hr/>
		<div class="row">
			<div style="text-decoration: underline;" class="col-sm-12"><?=get_phrase("scope");?>:</div>
			<?php 
				$scope = $this->db->get_where("scope",array("user_id"=>$user->user_id));
				
				if($scope->num_rows() > 0 ){
			?>
			<div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("two_way");?>:</span> <?=$scope->row()->two_way == "1"?get_phrase("yes"):get_phrase("no");?></div>
			<div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("strict");?>:</span> <?=$scope->row()->strict == "1"?get_phrase("yes"):get_phrase("no");;?></div>
			<div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("type");?>: </span> <?=ucfirst($scope->row()->type);?></div>
				
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("countries");?>:</span> 
				<?php 
					$countries  = $this->crud_model->scope_countries($user->user_id); 
					$country_names = array();
					foreach($countries as $country){
						$country_names[] = $this->db->get_where("country",array("country_id"=>$country))->row()->name;
					}	
					echo implode(",", $country_names);
				?>
			</div>
			
			<?php
				}
			?>
			
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("your_country");?>:</span> <?=$this->crud_model->get_type_name_by_id("country",$user->country_id);?>
		</div>
		<hr/>
	</div>	
</div>