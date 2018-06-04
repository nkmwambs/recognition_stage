<?php

$scope = $this->db->get_where("scope",array("user_id"=>$user->user_id));

// if(isset($results)){
	// print_r($results);
// }

?>

<div class="row">

	<div class="col-sm-10">
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
					
					//print_r($groupings);	
		?>
		
			<!-- Show nomination table if a vote has not been submitted -->
	
					<table class="table">
						<thead>
							
						</thead>
						<tbody>
							<?php foreach($groupings as $grouping_id=>$categories){?>
									<tr>
										<td colspan="6" style="background-color:#F5F5F5;font-weight: bolder;text-align: center;"><?=$this->crud_model->get_type_name_by_id("grouping",$grouping_id);?></td>
									</tr>
									<tr style="font-style: italic;">
										<td><?=get_phrase("category");?></td>
										<td><?=get_phrase("assignment");?></td>
										<td><?=get_phrase("visibility");?></td>
										<td><?=get_phrase("unit");?></td>
										<td><?=get_phrase("nominate_unit");?></td>
										<td><?=get_phrase("comment");?></td>
									</tr>
									
									<?php 
										/** Populate nominating Units Select form control. Derived from the static table Unit**/
										foreach($categories as $category){
											$category = (object)$category;
											$unit_table_name_object = $this->db->get_where("unit",array("unit_id"=>$category->unit));
											$unit_table_name = $unit_table_name_object->row()->name;
											
											/** Set country scope filter if a user has scope set **/
											
											if($scope->num_rows() >0 ){
												$cond = $this->crud_model->country_scope_where($this->session->login_user_id,$scope->row()->type);
											}
											
																						
											/** Add Unit filter controls here - Start **/	
											
											if($unit_table_name === "user"){
												/** User Filters Set here
												 * 
												 * Users cannot nominate themselves
												 * Cannot vote inactive users
												 * Users can only nominate users in the country and those assigned to the countries with Scope type of Both or Vote and Two Way set to Yes
												 * Users can nominate other country staff if have a scope of either Two Way set as yes or no and Type set as Voting.  
												 * 
												 * **/
												 
												 /** 
												  * Prevent listing self to the unit list and Inactive Users
												  * Filter users from other countries with the current user country within their scope and of type not equal to admin and scope two way set as yes 
												  * Show scoped users only for categories with visibility set as All i.e. 1 
												  * **/
												  
												 /** Set Manager User List here **/
												if($category->assignment == '2' && $unit_table_name === "user"){
													/** Only show staff that are managed by the current user for categories that require managers contribution **/
													$this->db->where(array("manager_id"=>$this->session->login_user_id));
												}else{
													/** List all staff for the country and those with scope to the country for voting **/
													 $cond2 = "user_id != ".$user->user_id." AND auth = 1"; 
													if($category->visibility === '1'){
														if($this->crud_model->users_with_country_scope_for_voting($user->country_id) !==""){
															$cond2 = $this->crud_model->users_with_country_scope_for_voting($user->country_id)." or user_id != ".$user->user_id." AND auth = 1";	
														}
														
													}
															 
													 $this->db->where($cond2);
												}
												  
												
												 
												 												 
												 /** Prevent listing users from other countries if the current logged user have no scope set**/
												 
												 if($scope->num_rows() > 0){
												 	/** Check if the Scope allows Voting i.e. Not Admin type. Allow voting other country staff if scope type is not admin **/
												 	if($scope->row()->type == "admin"){
												 		$this->db->where(array("country_id"=>$user->country_id));
												 	}else{
												 		/** Filter in all countries the current user has a voting scope for but for categories with all countries visibility**/
												 		if($category->visibility === '1'){
												 			$this->db->where($cond);
												 		}else{
												 			$this->db->where(array("country_id"=>$user->country_id));
												 		}
												 		
												 	}
													
												 }else{
												 	$this->db->where(array("country_id"=>$user->country_id));
												 }
												 
												
											}	
											
											if($unit_table_name === "team"){
												/** Team Filters Set here
												 * A user can only nominate a team from his or her residence country
												 * A user is not allowed to nominate teams the belong to
												 * 
												 * **/
												 
												 
												 /** Only list the current users country teams **/
												 	$cond4 = " country_id = ".$user->country_id;
													if($this->crud_model->user_teams_to_vote($user->user_id) !==""){
														$cond4 = $this->crud_model->user_teams_to_vote($user->user_id);	
													}
													
														 
												 	$this->db->where($cond4);
												 
												
											}
											
											if($unit_table_name === "department"){
												/** Deaprtment Filters Set here**/
												
											}
											
											if($unit_table_name === "country"){
												/** Country Filters Set here**/
												
											}
											
											
											 /** Add Unit filter controls here - End **/
											 
											 
											 
											 
																													
											$units = $this->db->get($unit_table_name)->result_object();										
											
											$options ='<select class="form-control nominate validate" id="'.$category->category_id.'">';
											
											$options .='<option value="">'.get_phrase("nominate_".$unit_table_name).'</option>';
											if(count($results) > 0){
												
												
																								
													foreach($units as $unit){
														$options_html = ""; 
															if($unit_table_name === "user"){
																$options_html = $unit->firstname.' '.$unit->lastname.' ['.$this->crud_model->get_type_name_by_id("country",$unit->country_id).']';
															}else{
																$options_html = $unit->name;
															}			
														$val = $unit_table_name;			
														$id = $unit_table_name.'_id';
														$show_choice = "";
														$selected = "";
														foreach($results as $result){
															if($category->category_id === $result->category_id){
																$unit_trace = $this->db->get_where("unit",array("unit_id"=>$result->nominated_unit))->row()->name;
																
																if($unit_trace === $unit_table_name){
																	$show_choice = $this->db->get_where($unit_table_name,array($id=>$result->nominee_id))->row()->$id;
																	
																}
															
															}
														}
														
														
														if($show_choice === $unit->$id){
															$selected ="selected='selected'";
														}
														
														$options .= '<option value="'.$unit->$id.'" '.$selected.'>'.$options_html.'</option>';
																							
																
													}
												}else{
													
													foreach($units as $unit){
														$options_html = ""; 
															if($unit_table_name === "user"){
																$options_html = $unit->firstname.' '.$unit->lastname.' ['.$this->crud_model->get_type_name_by_id("country",$unit->country_id).']';
															}else{
																$options_html = $unit->name;
															}			
														$val = $unit_table_name;			
														$id = $unit_table_name.'_id';
														
														$options .= '<option value="'.$unit->$id.'">'.$options_html.'</option>';
																								
																
													}
												}	
											$options .="</select>";
											
									?>
										
										<tr>
											<td><?=$category->name;?></td>
											<td><?=$this->crud_model->get_type_name_by_id("contribution",$category->assignment);?></td>
											<td><?=$this->crud_model->get_type_name_by_id("country",$category->visibility);?></td>
											<td><?=ucfirst($unit_table_name);?></td>
											<td><?=$options;?></td>
											<?php
												$comment = "";
												if(count($results) > 0){
													foreach($results as $result){
														if($result->category_id === $category->category_id){
															$comment = $result->comment; 
														}
													}
												}
											?>
											<td><textarea readonly="readonly" id="comment_<?=$category->category_id;?>" class="form-control validate comment" placeholder="<?=get_phrase("comment_here")?>"><?=$comment;?></textarea></td>
										</tr>
									<?php 
										}
									?>
									
							<?php }?>
							
							<tr>
								<td colspan="6" style="text-align: center;"><button id="submit_vote"  class="btn btn-success btn-icon"><i class="fa fa-star"></i><?=get_phrase("submit");?></button></td>
							</tr>
						</tbody>
					</table> 
		<?php
				}
			}
		}
		?>
	</div>
	
	
	
	<div class="col-sm-2">
		<div class="row">
			<div style="text-align: center;font-style: italic;font-weight: bold;" class="col-sm-12"><?=get_phrase("your_voting_privileges");?></div>
		</div>
		<hr/>
		<div class="row">
			<div style="text-decoration: underline;font-weight: bold;" class="col-sm-12"><?=get_phrase("contribution");?>:</div>
			
			
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("role");?>:</span> <?=$role->name;?></div>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("position");?>:</span> <?=$this->db->get_where("contribution",array("contribution_id"=>$role->contribution))->row()->name;?></div>
		</div>
		<hr/>
		<div class="row">
			<div style="text-decoration: underline;" class="col-sm-12"><?=get_phrase("scope");?>:</div>
			<?php 
				
				
				if($scope->num_rows() > 0 ){
			?>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("two_way");?>:</span> <?=$scope->row()->two_way == "1"?get_phrase("yes"):get_phrase("no");?></div>
			<!-- <div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("strict");?>:</span> <?=$scope->row()->strict == "1"?get_phrase("yes"):get_phrase("no");;?></div> -->
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("type");?>: </span> <?=ucfirst($scope->row()->type);?></div>
				
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

<script>
	$("#submit_vote").click(function(ev){
		
		var req_validate = $(".validate"); 
		var cnt = 0;
		
		$.each(req_validate,function(i,el){
			if($(el).val() === ""){
				cnt++;
				$(el).css("border","1px solid red");
			}
		});
		
		if(cnt > 0){
			alert("<?=get_phrase("you_have_missing_fields");?>");
		}else{
			var url = "<?=base_url();?>surveys/nominate/submit_vote/<?=$this->session->login_user_id;?>";
			$.ajax({
				url:url,
				success:function(){
					alert("<?=get_phrase("submit_successful");?>");
					window.location.reload();
				},
				error:function(){
					
				}
			})
		}
		
		ev.preventDefault();
	});
	
	
	$(".nominate").change(function(ev){
		var category_id = $(this).attr('id');
		var nominee_id = $(this).val();
		var user_id = '<?=$this->session->login_user_id;?>';
		
		var url = "<?=base_url();?>surveys/post_nomination_choice/" + category_id + '/' + nominee_id + '/' + user_id;
		
		
		$.ajax({
			url:url,
			success:function(response){
				//alert(response);
				$("#comment_"+category_id).removeAttr("readOnly");
			},
			error:function(){
				
			}
		});
		
		ev.preventDefault();
	});
	
	$(".comment").change(function(ev){
		var comment = $(this).val();
		var id = $(this).attr("id");
		var category_id = id.split("_")[1]; 
		var comment = $(this).val();
		var user_id = '<?=$this->session->login_user_id;?>';
		
		var data = {"category_id":category_id,"comment":comment,"user_id":user_id}
		
		var url = "<?=base_url();?>surveys/post_nomination_comment";
		
		
		$.ajax({
			url:url,
			data:data,
			type:"POST",
			success:function(response){
				
				
			},
			error:function(){
				
			}
		});
		
		ev.preventDefault();
		
	});
	
</script>