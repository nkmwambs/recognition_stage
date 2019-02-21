<div class="row">
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-plus-circled"></i>
					<?php echo get_phrase('add_user');?>
            	</div>
            </div>
			<div class="panel-body">
                    <?php echo form_open(base_url() . 'account/manage_users/add_user' , array('id'=> 'frm_add_user',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('first_name');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="firstname"  required="required" placeholder="<?=get_phrase("first_name");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('last_name');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="lastname"  required="required" placeholder="<?=get_phrase("last_name");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('gender');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" name="gender" required="required">
                                    	<option value=""><?=get_phrase("select");?></option>
                                    	<option value="male"><?=get_phrase("male");?></option>
                                    	<option value="female"><?=get_phrase("female");?></option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('email');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="email" id="email" required="required" placeholder="<?=get_phrase("email");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('phone');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="phone" id="phone" required="required" placeholder="254711808075"/>
                                </div>
                            </div>
                            
                            
                              <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('employee_number');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control"  name="employee_id" id="employee_id" required="required" placeholder="<?=get_phrase("employee_numner");?>"/>
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('country');?></label>
                                <div class="col-sm-5">
                                	<?php if($this->crud_model->get_field_value("scope","user_id",$this->session->login_user_id,"type") !== 'vote' ){?>
                            
                                    <select class="form-control selectpicker" name="country_id" id="country_id" required="required">
                                    	<option value=""><?=get_phrase("select");?></option>
                                    	<?php
                                    	
                                    		$countries = $this->db->get_where("country",array("country_id"=>$this->session->country_id))->result_object();//$this->crud_model->get_results_by_id("country");
											foreach($countries as $country):
                                    	?>
                                    		<option value="<?=$country->country_id;?>"><?=$country->name;?></option>
                                    	<?php
                                    		endforeach;
										
                                    	?>
                                    </select>
                                    
                                    <?php }else{?>
                                    	<input type="text" readonly="readonly" class="form-control" value="<?=$this->crud_model->get_type_name_by_id("country",$this->session->country_id);?>" />
                                    		<input type="hidden"  value="<?=$this->session->country_id;?>" name="country_id"  />
                                    <?php }?>	
                                </div>
                            </div>
                            
                            
                            <!-- <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('team');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="team_id[]" id="team_id" multiple="multiple">
                                    	
                                    	
                                    </select>
                                    <div id="team_loading_progress"></div>
                                </div>
                            </div> -->
                            
                                                  
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
                                <div class="col-sm-5">
                                	<?php
                                    		$roles = $this->crud_model->get_results_by_id("role");
											//print_r($roles);
									?>		
                                    <select class="form-control selectpicker" name="role_id"  required="required">
                                    	<option value=""><?=get_phrase("select");?></option>
                                    	<?php

											foreach($roles as $role):
                                    	?>
                                    		<option value="<?=$role->role_id;?>"><?=$role->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('manager');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" name="manager_id"  required="required">
                                    	<option value="0"><?=get_phrase("not_set");?></option>
                                    	<?php 
                                    		$this->db->join("role","role.role_id=user.role_id");
											$this->db->where(array("contribution"=>"2"));
                                    		$managers = $this->db->get("user")->result_object();
                                    		
											foreach($managers as $manager){	
                                    	?>
                                    		<option value="<?=$manager->user_id;?>"><?=$manager->firstname." ".$manager->lastname;?></option>	
                                    	<?php }?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('profile');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control selectpicker" name="profile_id" required="required">
                                    	<option value=""><?=get_phrase("select");?></option>
                                    	<?php
                                    		$profiles = $this->db->get_where("profile",array("assignable"=>1))->result_object();
											
											echo $this->crud_model->admin_user($this->session->login_user_id);
                                    		
                                    		if($this->crud_model->admin_user($this->session->login_user_id)
											&& $this->db->get_where("user",array("user_id"=>$this->session->login_user_id))->row()->system_admin == "1"){
                                    			$profiles = $this->db->get("profile")->result_object();	
                                    		}
                                    		
											
											foreach($profiles as $profile):
                                    	?>
                                    		<option value="<?=$profile->profile_id;?>"><?=$profile->name;?></option>
                                    	<?php
                                    		endforeach;
                                    	?>
                                    </select>
                                </div>
                            </div>
                            
                                                       
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <button type="submit"  class="btn btn-info btn-icon3"><i class="fa fa-save"></i><?php echo get_phrase('save');?></button>
                              </div>
							</div>
          
               </form>
               
               
            </div>
        </div>
    </div>
</div>



<script>

$(document).ready(function(){
	$('.selectpicker').selectpicker();
});

$("#email,#phone,#employee_id").change(function(){
	authenticate_user_add($(this));
});

function authenticate_user_add(el){
	var url = '<?=base_url();?>account/authenticate_user_add';
	var fld = el.attr("id");
	var data = {"field":fld,"value":el.val()};
	//alert(data.fld);
	 $.ajax({
		url:url,
		type:"POST",
		data:data,
 		success:function(resp){
 			//alert(resp);
 			if(resp=="0"){
 				$curVal = el.val();
 				el.val("");
 				el.parent().append("<div class='validate_field' style='color:red;'>Duplicate Error Occurrred: "+$curVal+"</div>")
 			}else{
 				el.siblings().remove();
 			}
 		},
 		error:function(err){
 			alert(err);
 		}
	 });
}

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