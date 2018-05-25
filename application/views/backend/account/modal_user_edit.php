<?php 
$edit_data		=	$this->db->get_where('user' , array('user_id' => $param2) )->result_object();
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
                    <?php echo form_open(base_url() . 'account/manage_users/edit_user/'.$param2.'/#users' , array('id'=> 'frm_edit_user',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
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
                                    <select class="form-control select2" name="gender">
                                    	<option><?=get_phrase("select");?></option>
                                    	<option value="male" <?php if($row->gender === "male") echo "selected";?>><?=get_phrase("male");?></option>
                                    	<option value="female" <?php if($row->gender === "female") echo "selected";?>><?=get_phrase("female");?></option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group <?php if($this->session->login_user_id === $param2) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('email');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" value="<?=$row->email;?>" name="email" required="required" placeholder="<?=get_phrase("email");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('phone');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" value="<?=$row->phone;?>" name="phone" required="required" placeholder="254711808075"/>
                                </div>
                            </div>
                            
                            
                           
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('country');?></label>
                                <div class="col-sm-5">
                                	 <?php if($this->crud_model->get_field_value("scope","user_id",$this->session->login_user_id,"type") !== 'vote' ){?>
                                    <select class="form-control select2" name="country_id">
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
                            
                            
                            
                            <div class="form-group <?php if($this->session->login_user_id === $param2) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control select2" name="role_id">
                                    	<option><?=get_phrase("select");?></option>
                                    	<?php
                                    		$roles = $this->crud_model->get_results_by_id("role");
											
											foreach($roles as $role):
                                    	?>
                                    		<option value="<?=$role->role_id;?>" <?php if($row->role_id === $role->role_id) echo "selected";?> ><?=$role->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group <?php if($this->session->login_user_id === $param2) echo "self_update";?>">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('profile');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control select2" name="profile_id">
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
                                  <div  class="btn btn-info btn-icon submit"><i class="fa fa-save"></i><?php echo get_phrase('save');?></div>
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