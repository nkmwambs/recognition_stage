<?php 
$edit_data		=	$this->db->get_where('user' , array('user_id' => $user_id) )->result_object();
//print_r($edit_data);
foreach ( $edit_data as $row):
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
                    <?php echo form_open(base_url() . 'account/manage_users/edit_user/'.$user_id.'/#users' , array('id'=> 'frm_edit_user',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('first_name');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="firstname" value="<?=$row->firstname;?>"  required="required" placeholder="<?=get_phrase("first_name");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('last_name');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="lastname" value="<?=$row->lastname;?>"  required="required" placeholder="<?=get_phrase("last_name");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('gender');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" data-live-search="true" name="gender">
                                    	<option><?=get_phrase("select");?></option>
                                    	<option value="male" <?php if($row->gender === "male") echo "selected";?>><?=get_phrase("male");?></option>
                                    	<option value="female" <?php if($row->gender === "female") echo "selected";?>><?=get_phrase("female");?></option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group <?php if($this->session->login_user_id === $user_id) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('email');?></label>
                                <div class="col-sm-5">
                                    <input type="mail"  class="form-control" value="<?=$row->email;?>" name="email" required="required" placeholder="<?=get_phrase("email");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('phone');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" value="<?=$row->phone;?>" name="phone" required="required" placeholder="254711808075"/>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('employee_number');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" value="<?=$row->employee_id;?>" name="employee_id" required="required" placeholder="<?=get_phrase("employee_numner");?>"/>
                                </div>
                            </div>
                           
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('country');?></label>
                                <div class="col-sm-5">
                                	 <?php if($this->crud_model->get_field_value("scope","user_id",$this->session->login_user_id,"type") !== 'vote' ){?>
                                    <select class="form-control selectpicker" data-live-search="true" name="country_id">
                                    	<option><?=get_phrase("select");?></option>
                                    	<?php
                                    		$countries = $this->crud_model->get_results_by_id("country");
											
											foreach($countries as $country):
                                    	?>
                                    		<option value="<?=$country->country_id;?>" <?php if($row->country_id === $country->country_id) echo "selected";?> ><?=$country->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                    <?php }else{?>
                                    	<input type="text" readonly="readonly" class="form-control" value="<?=$this->crud_model->get_type_name_by_id("country",$row->country_id);?>" />
                                    		<input type="hidden"  value="<?=$row->country_id;?>" name="country_id"  />
                                    <?php }?>	
                                </div>
                            </div>
                            
                            
                            <div class="form-group <?php if($this->session->login_user_id === $user_id) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" data-live-search="true" name="role_id">
                                    	<option><?=get_phrase("select");?></option>
                                    	<?php
                                    		$roles = $this->db->get("role")->result_object();
											
											foreach($roles as $role):
                                    	?>
                                    		<option value="<?=$role->role_id;?>" <?php if(isset($row->role_id ) && ($row->role_id === $role->role_id)) echo "selected";?> ><?=$role->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('manage_staff_in_resident_country?');?></label>
                                <div class="col-sm-5">
                                		
                                    <select class="form-control selectpicker" data-live-search="true" name="manage_staff_in_your_country"  required="required">
                                    	<option value=""><?=get_phrase("select");?></option>
                                    	
                                    	<option value="1" <?php if($row->manage_staff_in_your_country==1) echo 'selected';?>><?=get_phrase("No");?></option>
                                    	<option value="2" <?php if($row->manage_staff_in_your_country==2) echo 'selected';?>><?=get_phrase("Yes");?></option>
        
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('manager');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" data-live-search="true" name="manager_id">
                                    	<option value="0"><?=get_phrase("select");?></option>
                                    	<?php 
                                    		$this->db->join("role","role.role_id=user.role_id");
											$this->db->where(array("contribution"=>"2"));
                                    		$managers = $this->db->get("user")->result_object();
                                    		
											foreach($managers as $manager){	
                                    	?>
                                    		<option value="<?=$manager->user_id;?>" <?php if($manager->user_id === $row->manager_id) echo "selected";?>><?=$manager->firstname." ".$manager->lastname;?></option>	
                                    	<?php }?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group <?php if($this->session->login_user_id === $user_id) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('profile');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" data-live-search="true" name="profile_id">
                                    	<option><?=get_phrase("select");?></option>
                                    	<?php
                                    		$profiles = $this->crud_model->get_results_by_id("profile");
											
											foreach($profiles as $profile):
                                    	?>
                                    		<option value="<?=$profile->profile_id;?>"  <?php if($row->profile_id === $profile->profile_id) echo "selected";?> ><?=$profile->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                </div>
                            </div>
                            
                                                       
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <button  class="btn btn-info btn-icon"><i class="fa fa-save"></i><?php echo get_phrase('save');?></button>
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
$("#country_id").change(function(){
	var country_id = $(this).val();
	var url = "<?=base_url();?>account/get_country_teams/"+country_id;
	
	$.ajax({
		url:url,
		beforeSend:function(){
			$("#team_loading_progress").html('<div style="text-align:center;margin-top:0px;"><img style="width:00px;height:80px;" src="<?php echo base_url();?>uploads/preloader2.gif" /></div>');
		},
		success:function(resp){
			$("#team_loading_progress").html('');
			$("#team_id").html(resp);
		},
		error:function(){
			
		}
	});
});

</script>