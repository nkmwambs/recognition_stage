<?php
//$this->db->select(array('user_id','firstname','lastname'));
//print_r($this->db->get_where('user',array('manager_id'=>169))->result_object());
/**
 * Creates an object for users who have a ability to vote or be voted or
 * administrate the system aoutside the country the user resides in.
 * If the user is not found in this object, then he/she is restricted to
 * vote or be voted in his/her country, He/has no ability to administrate
 * outside his country.
 *
 * It determines the users you can vote for outside your country of residence if you exists
 * in the scope table. With two way == 1 you can vote and be vote by the other country users whereas if 0, then
 * you can only be voted by other country users but you can't vote for them.
 *
 */
$scope = $this->db->get_where("scope",array("user_id"=>$this->session->login_user_id,'two_way'=>1));

//echo $this->post_subteam_manager_id();

?>

<div class="row">

	<div class="col-sm-12">

		<?php

			/**
			 * Check if an active survey exists. If no show the message there is no
			 * active survey or else check if a vote has been initiated
			 */

			$active_survey = $this->db->get_where("survey",
				array("status"=>"1",'end_date >'=>date('Y-m-d h:m:i')));

			if($active_survey->num_rows() === 0){
		?>
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
					<div class="well"><?=get_phrase("there_is_no_active_survey");?></div>
				</div>
			</div>
		<?php
			}else{

				/** Check if a vote has been initiated for the current active survey.
				 * If no, show the start voting button
				 *
				 * */

				$survey_result = $this->db->get_where("result",array("user_id"=>$this->session->login_user_id,
				"survey_id"=>$active_survey->row()->survey_id));

				if($survey_result->num_rows() === 0){
		?>
				<div class="row">
					<div class="col-sm-12" style="text-align: center;">
						<a href="<?=base_url();?>surveys/nominate/start_nomination/<?=$this->session->login_user_id;?>" class="btn btn-danger btn-icon"><i class="fa fa-hourglass-start"></i><?=get_phrase("start_voting");?></a>
					</div>
				</div>
		<?php
				}else{

				/** Check if a vote has not been submitted. If submitted check if the survey
				 * allows edit and show the survey edit link
				 *  Status = 1 => Vote has been submitted, 0=> Not submitted the vote
				 * **/

				$survey_result_voted = $this->db->get_where("result",
				array("user_id"=>$this->session->login_user_id,"survey_id"=>$active_survey->row()->survey_id,
				"status"=>'0'));// Returns not submitted votes

				/**
				 * Return number of rows == 0 means the user has submitted their votes
				 */

				if($survey_result_voted->num_rows() === 0 ){
		?>
				<div class="row">
					<div class="col-sm-12" style="text-align: center;">
						<div class="well"><?=get_phrase("you_have_already_participated_in_voting");?></div>
						<?php
								/**
								 * Check if the survey settings allows the user to edit
								 * the votes already submitted.
								 * If allowed, the user is provided to renominate and vote.
								 */

								if($active_survey->row()->allow_user_edit == '1'){?>
									<a href="<?=base_url();?>surveys/nominate/edit_nomination/<?=$active_survey->row()->survey_id;?>"
										class="btn btn-primary btn-block"><?=get_phrase('re_do_nomination')?></a>
									<?php }
						?>
					</div>
				</div>


				<?php
					}else{

					//print_r($groupings);
				?>

				<!-- Show nomination table if a vote has not been submitted -->
					<div class="row">
						<div class="col-xs-12">

						<div class="panel-group" id="accordion-test">
						<?php
							$grouping_cnt = 0;
							foreach($controller_groupings as $grouping_id=>$categories){
						?>
							<div class="panel panel-success">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="btn btn-icon btn-block" data-toggle="collapse" data-parent="#accordion-test" href="#collapse_<?=$grouping_id;?>">
											<i class="fa fa-<?=$this->crud_model->get_type_name_by_id("grouping",$grouping_id,'fa-icon');?>"></i>
											 <?=$this->crud_model->get_type_name_by_id("grouping",$grouping_id);?>
										</a>
									</h4>
								</div>

								<div id="collapse_<?=$grouping_id;?>" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table table-striped">
											<thead>
												<tr style="font-style: italic;">
													<th><?=get_phrase("category");?></th>
													<th><?=get_phrase("visibility");?></th>
													<?php if($grouping_id==1){?>
													 <th><?=get_phrase("nominate_staff");?></th>	
													<?php 
													}
													elseif($grouping_id==3){?>
														<th><?=get_phrase("nominate_special_team");?></th>
													<?php }?>
													
													
													<?php
														if($grouping_id == 4){
													?>
													    <th><?=get_phrase("nominate_department");?></th>
														<th><?=get_phrase('nominate_sub_team');?></th>
													<?php
														}
													?>
													<th><?=get_phrase("comment");?></th>
												</tr>
											</thead>
											<tbody>
												<?php
												    
											        /** Populate nominating Units Select form control. Derived from the static table Unit**/
													foreach($categories as $category){
														//Get the table name of the units to nominate Ex. User/ Staff, Department, Team or Country
														$unit_table_name = $this->db->get_where("unit",array("unit_id"=>$category->unit))->row()->name;

														//Get potential nominees
														$potential_nominees = $this->crud_model->list_potential_nominees_per_category($unit_table_name,$category);

														//Create a potential nominees select tag
														$units_select_tag = select_tag($unit_table_name,$category,$potential_nominees,$controller_nominees);

														if(count($potential_nominees[0]) == 0) {
															$units_select_tag = get_phrase("missing_".$unit_table_name."s_for_nomination");
														}


												?>
														<tr>
															<td>
																<a href="#" data-html="true" data-toggle="tooltip" title="<?=$category->description;?>">
																	<?=$category->name;?>
																</a>
															</td>
															<td><?=$this->crud_model->get_type_name_by_id("country",$category->visibility);?></td>

															<td><?=$units_select_tag;?></td>
															<?php
																/**
																 * Loops $controller_nominees as it populates the comments of the nominees
																 */
																$comment = "";
																$subteam = "";
																if(count($controller_nominees) > 0){
																	foreach($controller_nominees as $nominee){
																		if($nominee->category_id === $category->category_id){
																			$comment_subteam = explode("|", $nominee->comment);
																			if(count($comment_subteam) > 1){
																				$comment = $comment_subteam[1];
																				$subteam = $comment_subteam[0];
																			}else{
																				$comment = $comment_subteam[0];
																			}

																			break;
																		}

																	}
																}

																if($grouping_id == 4){
																	$disabled = "disabled = 'disabled'";
																	if($category->category_id == $nominee->category_id && $nominee->nominee_id != 0){
																		$disabled = "";
																	}
															?>
																<td>
																	<?php 
																	 //Populate the dropdown of subteams 
																	 echo select_tag_department_subteam($category->category_id,$nominee->nominee_id,$this->session->login_user_id);
																	?>
																</td>
															<?php
																//print_r($controller_nominees);
																}
															?>
															<td>
																<textarea readonly="readonly" id="comment_<?=$category->category_id;?>"
																	class="form-control validate comment"
																placeholder="<?=get_phrase("comment_here")?>"><?=$comment;?></textarea>
															</td>
														</tr>
												<?php
													}
												?>

											</tbody>
										</table>
									</div>
								</div>

							</div>

						<?php
							$grouping_cnt++;
						}
						?>
						</div>


						</div>
					</div>

					<div class="row">
						<div class='col-xs-12' style="text-align: center;">
								<button id="submit_vote"  class="btn btn-success btn-icon">
									<i class="fa fa-star"></i><?=get_phrase("submit_vote");?>
								</button>
						</div>
					</div>


		<?php
				}
			}
			}

		?>
	</div>
</div>

	<hr />

	<div class="row">
		<div class="col-sm-12">
			<div style="text-align: center;font-style: italic;font-weight: bold;" class="col-sm-12">
				<?=get_phrase("your_voting_privileges");?>
			</div>
		</div>
	</div>

	<hr />

	<div class="row">
		<div class="col-sm-6">
			<div style="text-decoration: underline;font-weight: bold;" class="col-sm-12"><?=get_phrase("contribution");?>:</div>

			<!--Return user role, position, department and profile name -->
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("role");?>:</span> <?=$this->session->role_name;?></div>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("position");?>:</span> <?=ucfirst($this->session->staff_position_name);?></div>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("department");?>:</span> <?=$this->session->department_name;?></div>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("user_profile");?>:</span> <?=$this->session->profile_name;?></div>
			<div class="col-sm-12">
					<span style="font-weight: bold;"><?=get_phrase("teams");?>:</span>
					<!--List name of special teams for a logged in user -->
					<?=$this->crud_model->get_team_name_of_the_logged_in_user();?>
			</div>
		</div>

		<div class="col-sm-6">
			<div style="text-decoration: underline;font-weight: bold;" class="col-sm-12"><?=get_phrase("scope");?>:</div>

			<?php

				if($scope->num_rows() > 0 ){
			?>
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("two_way");?>:</span> <?=$scope->row()->two_way == "1"?get_phrase("yes"):get_phrase("no");?></div>
			<!-- <div class="col-sm-6"><span style="font-weight: bold;"><?=get_phrase("strict");?>:</span> <?=$scope->row()->strict == "1"?get_phrase("yes"):get_phrase("no");;?></div> -->
			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("type");?>: </span> <?=ucfirst($scope->row()->type);?></div>

			<div class="col-sm-12"><span style="font-weight: bold;"><?=get_phrase("countries");?>:</span>
				<?=$this->crud_model->get_scope_countries_names_of_logged_in_user();?>
			</div>

			<?php
				}
			?>

			<div class="col-sm-12">
				<span style="font-weight: bold;"><?=get_phrase("your_country");?>:</span> <?=$this->session->country_name;?>
			</div>
		</div>

	</div>

<script>
// Make the subteams and comments readonly until you select a function teams
$(document).ready(function(){

   
	$.each($(".nominate"),function(i,el){
			if($(el).val() != 0){
				
				$("#comment_"+$(el).attr("id")).removeAttr("readOnly");
				
				$("#subteam_"+$(el).attr("id")).removeAttr("disabled");
				//Check if the comment textbox has 'No Viable Option' text and then clear it
				if($("#comment_"+$(el).attr("id")).val()=='No Viable Option'){
					
					$("#comment_"+$(el).attr("id")).val('');
				}
				
				
				//$("#subteam_"+$(el).attr("id")).val("<?=get_phrase('select_subteam');?>");
				
			}else{
				//$("#comment_"+$(el).attr("id")).removeAttr("readOnly");
				
				//$("#subteam_"+$(el).attr("id")).removeAttr("disabled");
			}
	});
});

//Before submit check if comment and subteam dropdown is <> 'select subteam'
	$("#submit_vote").click(function(ev){
        //Get all the comments textboxes and loop all of them checking if they are empty
		var req_validate = $(".comment");
		var cnt = 0;

		$.each(req_validate,function(i,el){
			if($(el).val() === "" && !$(el).prop('readonly')){
				cnt++;
				$(el).css("border","1px solid red");
			}
		});
	  
	  //Get all the subteams dropdown and loop all of them checking if they are empty
       var validate_subteam_dropdown=$(".subteam");
       $.each(validate_subteam_dropdown,function(index,element){
         if($(element).val()=='no_subteam' && !$(element).prop('disabled')){
         	cnt++;
			$(element).css("border","1px solid red");
         }
       });
	
		//If cnt> 0 return a message otherwise
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
		
		//Variables
		var category_id = $(this).attr('id');
		var nominee_id = $(this).val();		
		var user_id = '<?=$this->session->login_user_id;?>';
		
		
		
        //url to post to
		var url = "<?=base_url();?>surveys/post_nomination_choice/" + category_id + '/' + nominee_id + '/' + user_id;

		if($(this).val() !== "0"){
			//Toggle sub team to enable
			//$("#subteam_"+category_id).removeAttr('disabled');

			//Invoke ajax to get list of managers/ sub functional teams in the department (Enhancement)
			$.get('<?=base_url();?>surveys/get_managers_in_a_department/'+$(this).val(),function(resp){
					$("#subteam_"+category_id).html(resp);
			});

			$("#comment_"+category_id).removeAttr("readOnly");
			$("#comment_"+category_id).val('');
			$("#subteam_"+category_id).removeAttr("disabled");
			
		}else{
			//Toggle sub team to disable and comment text area to readonly
			$("#subteam_"+category_id).prop('disabled','disabled');
			$("#comment_"+category_id).prop("readOnly",'readOnly');
			$("#comment_"+category_id).val("<?=get_phrase('no_viable_option');?>");
			
			//When user selects 'No Viable Option' after selecting a value > 0 e.g. partnership department
			//Rebuild the dropdown for subteams by repopulating it. This action also 
			//disables the subteam dropdown since the department dropdown value=0
			$.get('<?=base_url();?>surveys/get_managers_in_a_department/'+$(this).val(),function(resp){
					$("#subteam_"+category_id).html(resp);
			});
		}

		$.ajax({
			url:url,
			success:function(resp){
				//alert(resp);
			},
			error:function(){

			}
		});

		ev.preventDefault();
	});

$(".subteam").change(function(){
		//alert($(this).val());
		var id = $(this).attr("id");
		var category_id = id.split("_")[1];
		var user_id = '<?=$this->session->login_user_id;?>';
		
		//Remove the Css style once the user selects a value in the subteam
		$.each($(this),function(index,element){
			$(element).removeAttr('style');
       });
				
		var data = {"category_id": category_id, "subteam_manager_id":$(this).val(),"user_id":user_id};
		var url = '<?=base_url();?>surveys/post_subteam_manager_id/'+$(this).val();
		
		$.ajax({
			url:url,
			type:'POST',
			data:data,
			success:function(msg){
				
              alert(msg);
			},
			error:function(oberr,msg){
				
				//alert(msg);

			}
		});
});

$(".comment").change(function(ev){
		var id = $(this).attr("id");
		var category_id = id.split("_")[1];

		var comment = $("#comment_"+category_id).val();

		var appended_comment = comment;


		var user_id = '<?=$this->session->login_user_id;?>';

		var data = {"category_id":category_id,"comment":appended_comment,"user_id":user_id}

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
    //$('select').trigger('change');
</script>
