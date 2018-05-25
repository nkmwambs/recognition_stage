<?php
//print_r($countries);
//echo $page_name;
?>
<div class="row">

	<div class="col-md-12">
    
    	<!------CONTROL TABS START------>
		<ul class="nav nav-tabs bordered">

			<li class="active">
            	<a href="#show_teams" data-toggle="tab"><i class="entypo-users"></i> 
					<?php echo get_phrase('teams');?>
                    	</a>
            </li>
			
			<li class="">
            	<a href="#add_team" data-toggle="tab"><i class="entypo-plus"></i> 
					<?php echo get_phrase('add_team');?>
                    	</a>
            </li>
                        
    	    
		</ul>
    	<!------CONTROL TABS END------>
        
	
		<div class="tab-content">
			<!-- START ALL COUNTRIES-->
			<div class="tab-pane box active" id="show_teams" style="padding: 5px">
               <div class="box-content">
					<table class="table table-striped datatable">
						<thead>
							<tr>
								<th><?=get_phrase("name");?></th>
								<th><?=get_phrase("country");?></th>
								<th><?=get_phrase("description");?></th>
								<th><?=get_phrase("action");?></th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($teams as $team):?>
								<tr>
									<td><?=$team->name;?></td>
									<td><?php if($this->crud_model->get_type_name_by_id("country",$team->country_id) !== NULL) echo $this->crud_model->get_type_name_by_id("country",$team->country_id);?></td>
									<td><?=$team->description;?></td>
									<td>
										 <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		                                        Action <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-default pull-right" role="menu">
		                                        
		                                        <!-- COUNTRY EDITING  -->
		                                        <li>
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_team_edit/<?php echo $team->team_id;?>');">
		                                                <i class="entypo-pencil"></i>
		                                                    <?php echo get_phrase('edit');?>
		                                                </a>
		                                        </li>
		                                        <li class="divider"></li>
		                                        
		                                        		                                        
		                                        <!-- COUNTRY DELETION  -->
		                                        <li>
		                                            <a href="#" onclick="confirm_dialog('<?php echo base_url();?>account/teams/team_delete/<?php echo $team->team_id;?>');">
		                                                <i class="entypo-trash"></i>
		                                                    <?php echo get_phrase('delete');?>
		                                                </a>
		                                        </li>
		                                    </ul>
		                                </div>
									</td>
								</tr>
							<?php endforeach;?>
						</tbody>
					</table>
             </div>
			</div>
			
			<!-- END ALL COUNTRIES-->
			
			<!-- START ADD COUNTRIES-->
						
			<div class="tab-pane box" id="add_team" style="padding: 5px">
               <div class="box-content padded">
					<?php 
                     	echo form_open(base_url() . 'account/teams/team_add' , array('id'=>'frm_country', 'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top' , 'enctype' => 'multipart/form-data'));
                    ?>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('team');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" required="required" placeholder="<?=get_phrase("team_title");?>"/>
                                </div>
                            </div>
                            
                            <!-- <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('country');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="country_id">
                                    	<option><?=get_phrase("select")?></option>
                                    	<?php 
                                    		$countries = $this->crud_model->get_results_by_id("country");
                                    		foreach($countries as $country):
                                    	?>
                                    		<option value="<?=$country->country_id;?>"><?=$country->name;?></option>
                                    	<?php endforeach;?>
                                    </select>
                                </div>
                            </div> -->
                            
                            
                            
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
                            
                            
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('description');?></label>
                                <div class="col-sm-5">
                                    <textarea  class="form-control" name="description" required="required" placeholder="<?=get_phrase("description")?>"></textarea>`
                                </div>
                            </div>
                            
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <div class="btn btn-info btn-icon submit"><i class="fa fa-save"></i><?php echo get_phrase('save');?></div>
                              </div>
							</div>
                        </form>
             </div>
			</div>
            
            <!-- END ADD COUNTRIES-->
			
			
		</div>
	</div>
	
</div>

<!-- This Script must available in every form view - START -->
<script>
	$(document).ready(function(){
		var datatable = $('.table').DataTable();
		
		
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

<!-- This Script must available in every form view - END -->