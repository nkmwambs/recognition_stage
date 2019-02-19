<?php 
//echo $this->crud_model->user_teams($this->session->login_user_id,$this->session->country_id);
foreach ($user as $row):
?>

<div class="row">
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-pencil"></i>
					<?php echo get_phrase('edit_user');?>
            	</div>
            </div>
			<div class="panel-body">
                    <?php echo form_open(base_url() . 'account/edit_user_profile/'.$this->session->login_user_id , array('id'=> 'frm_edit_profile',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('first_name');?></label>
                                <div class="col-sm-5">
                                    <div class="control-label pull-left"><?=$row->firstname;?></div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('last_name');?></label>
                                <div class="col-sm-5">
                                     <div class="control-label pull-left"><?=$row->lastname;?></div>
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
                            
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('phone');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" value="<?=$row->phone;?>" name="phone" required="required" placeholder="254711808075"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('password');?></label>
                                <div class="col-sm-5">
                                    <input type="password"  class="form-control" value="<?=$row->password;?>"  name="password"  placeholder="<?=get_phrase("password");?>"/>
                                </div>
                            </div>
                            
                            
                                                       
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <button id="btn_save"  class="btn btn-info btn-icon"><i class="fa fa-save"></i><?php echo get_phrase('save');?></button>
                              </div>
							</div>
          
               </form>
               
               
            </div>
        </div>
    </div>
</div>

<?php
endforeach;
?>

<script>
	
		$("#btn_save").click(function(ev){
			var frm = $("#frm_edit_profile");
			var url = frm.attr("action");
			var data = frm.serializeArray();
			//alert(url);
			$.ajax({
				url:url,
				data:data,
				success:function(resp){
					alert(resp);
				},
				error:function(err){
					alert(err);
				}
			});
			return false;
		});
	
</script>