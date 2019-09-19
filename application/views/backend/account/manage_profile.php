<style>
	.tab-pane{
		padding: 30px 0px 0px 10px;
	}
</style>

<?php
	echo form_open(base_url() . 'account/edit_user_profile/' , array('id'=> 'frm_edit_profile',
				'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));
	$row = $this->db->get_where('user',array('user_id'=>$this->session->login_user_id))->row();
?>


<div class="row">
	<div class="col-xs-12">

				<ul class="nav nav-tabs bordered right-aligned">
					<li class="active  <?php if($this->session->sso_login == 1){echo "hidden";};?>">
						<a href="#change_password" data-toggle="tab">
							<span class="visible-xs"><i class="entypo-home"></i></span>
							<span class="hidden-xs"><?=get_phrase('change_password');?> <i class="fa fa-lock"></i></span>
						</a>
					</li>
					<li class="<?php if($this->session->sso_login == 1){echo "active";};?>">
						<a href="#general_information" data-toggle="tab">
							<span class="visible-xs"><i class="entypo-user"></i></span>
							<span class="hidden-xs"><?=get_phrase('general_information');?> <i class="fa fa-user"></i></span>
						</a>
					</li>

					<li>
						<a href="#voter_information" data-toggle="tab">
							<span class="visible-xs"><i class="entypo-user"></i></span>
							<span class="hidden-xs"><?=get_phrase('voter_information');?> <i class="fa fa-thumbs-up"></i></span>
						</a>
					</li>

					<li>
						<a href="#role_information" data-toggle="tab">
							<span class="visible-xs"><i class="entypo-user"></i></span>
							<span class="hidden-xs"><?=get_phrase('role_information');?> <i class="fa fa-male"></i></span>
						</a>
					</li>



				</ul>

				<div class="tab-content">

					<div class="tab-pane active <?php if($this->session->sso_login == 1){echo "hidden";};?>" id="change_password">


                                <label class="col-sm-3 control-label"><?php echo get_phrase('password');?></label>
                                <div class="col-sm-5">

                                    <input type="password" id="password"  class="form-control" value="<?=$row->password;?>"
                                    	name="password"  placeholder="<?=get_phrase("password");?>"/>
                                </div>


					</div>
					<div class="tab-pane" id="general_information">
										 <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('full_name');?></label>
			                                <div class="col-sm-5">
			                                    <div class="control-label pull-left"><?=$row->firstname.' '.$row->lastname;?></div>
			                                </div>
			                            </div>


			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('gender');?></label>
			                                <div class="col-sm-5">
			                                     <div class="control-label pull-left"><?=$row->gender;?></div>
			                                </div>
			                            </div>

			                            <div class="form-group <?php if($this->session->login_user_id === $this->session->login_user_id) echo "self_update";?>">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('email');?></label>
			                                <div class="col-sm-5">
			                                     <div class="control-label pull-left"><?=$row->email;?></div>
			                                </div>
			                            </div>

			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('employee_number');?></label>
			                                <div class="col-sm-5">
			                                    <div class="control-label pull-left"><?=$row->employee_id;?></div>
			                                </div>
			                            </div>

			                             <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('phone');?></label>
			                                <div class="col-sm-5">
			                                    <input type="text"  class="form-control" value="<?=$row->phone;?>" name="phone" required="required" placeholder="254711808075"/>
			                                </div>
			                            </div>

								</div>
								<div class="tab-pane" id="voter_information">
										 <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('scope_countries');?></label>
			                                <div class="col-sm-5">
			                                	 <div class="control-label pull-left">
			                                	 	<?php
			                                	 		echo implode(",",$this->crud_model->scope_countries_by_name($this->session->login_user_id,true));
			                                	 	?>
			                                	 </div>
			                                </div>
			                            </div>

			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('scope_type');?></label>
			                                <div class="col-sm-5">
			                                	 <div class="control-label pull-left">
			                                	 	<?php
			                                	 		$scope_record = $this->db->get_where("scope",array("user_id"=>$this->session->login_user_id));
														if($scope_record->num_rows() > 0){
															echo ucfirst($scope_record->row()->type);
														}else{
															echo get_phrase("vote");
														}
			                                	 	?>
			                                	 </div>
			                                </div>
			                            </div>

			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('scope_way');?></label>
			                                <div class="col-sm-5">
			                                	 <div class="control-label pull-left">
			                                	 	<?php
			                                	 		$scope_record = $this->db->get_where("scope",array("user_id"=>$this->session->login_user_id));
														if($scope_record->num_rows() > 0){
															echo $scope_record->row()->two_way == '1'?get_phrase("two_way"):get_phrase("one_way");
														}else{
															echo get_phrase("two_way");
														}
			                                	 	?>
			                                	 </div>
			                                </div>
			                            </div>
								</div>
								<div class="tab-pane" id="role_information">
										<div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('team');?></label>
			                                <div class="col-sm-5">

			                                    	<?php

														$this->db->join("teamset","teamset.team_id=team.team_id");
														$teams = $this->db->get_where("team",array("country_id"=>$row->country_id,"user_id"=>$this->session->login_user_id));

														if($teams->num_rows() > 0){
													?>
															<div class="control-label pull-left"><?=implode(",",array_column($teams->result_array(),"name"));?></div>
													<?php
														}else{
													?>
															<div class="control-label pull-left"><?=get_phrase("teams_not_set");?></div>
													<?php
														}
			                                    	?>

			                                </div>
			                            </div>


			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
			                                <div class="col-sm-5">
			                                     <div class="control-label pull-left"><?=$this->db->get_where("role",array("role_id"=>$row->role_id))->row()->name;?></div>
			                                </div>
			                            </div>

			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('manager');?></label>
			                                <div class="col-sm-5">
			                                    <div class="control-label pull-left">
			                                    	<?php
			                                    		$manager_rec = $this->db->get_where("user",array("user_id"=>$row->manager_id));

														echo $manager_rec->num_rows()>0?$manager_rec->row()->firstname." ".$manager_rec->row()->lastname:get_phrase("not_set");

			                                    	?>
			                                    </div>
			                                </div>
			                            </div>


			                            <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('profile');?></label>
			                                <div class="col-sm-5">
			                                     <div class="control-label pull-left">
			                                     	<?php
			                                     		$profile_rec = $this->db->get_where("profile",array("profile_id"=>$row->profile_id));
			                                     		echo $profile_rec->num_rows()>0?$profile_rec->row()->name:get_phrase("not_set");
			                                     	?>
			                                     </div>
			                                </div>
			                            </div>

			                             <div class="form-group">
			                                <label class="col-sm-3 control-label"><?php echo get_phrase('system_admin');?></label>
			                                <div class="col-sm-5">
			                                     <div class="control-label pull-left">
			                                     	<?php

			                                     		echo $this->db->get_where("user",array("user_id"=>$this->session->login_user_id))->row()->system_admin == "1"?get_phrase('yes'):get_phrase('no');
			                                     	?>
			                                     </div>
			                                </div>
		                            </div>
								</div>

		</div>

	</div>
</div>

<hr />

<div class="row">
	<div class="col-xs-12">
		<div class="form-group">
             <div class="col-sm-offset-3 col-sm-5">
                  <a href="#" id="btn_save" class="btn btn-info btn-icon"><i class="fa fa-save"></i><?php echo get_phrase('save');?></a>
            </div>
		</div>
	</div>
</div>

</form>





<script>

		function validate_password(password_id) {

		    var pswd = $("#"+password_id).val();

		    var message = "";
		    //validate the length
			if ( pswd.length < 8 ) {
			    message += "Your password is less than 8 characters \n";
			}

			//validate letter
			if (!pswd.match(/[A-z]/) ) {
			     message += "Your password is missing an alphabet character \n";
			}

			//validate capital letter
			if (!pswd.match(/[A-Z]/) ) {
			    message += "Your password is missing a capitalized case alphabet character \n";
			}

			//validate number
			if (!pswd.match(/\d/) ) {
			     message += "Your password is missing a numeric character \n";
			}

			return message;
		}


		$("#btn_save").click(function(ev){


			if(validate_password('password')!="") {alert(validate_password('password')); return false;}

			var frm = $("#frm_edit_profile");
			var url = frm.attr("action");
			var data = frm.serializeArray();
			//alert(url);
			$.ajax({
				url:url,
				data:data,
				type:"POST",
				success:function(resp){
					window.location.href = resp;
				},
				error:function(err){
					alert(err);
				}
			});
			return false;
		});

</script>
