<?php
//print_r($countries);
//echo $page_name;
?>
<div class="row">
	<!--Showing Progress GIF. Must be available in evert form-->
	<div class="col-md-12 inner-progress"></div>
	
	<div class="col-md-12">
    
    	<!------CONTROL TABS START------>
		<ul class="nav nav-tabs bordered">

			<li class="active">
            	<a href="#show_roles" data-toggle="tab"><i class="entypo-bag"></i> 
					<?php echo get_phrase('roles');?>
                    	</a>
            </li>
			
			<li class="">
            	<a href="#add_role" data-toggle="tab"><i class="entypo-plus"></i> 
					<?php echo get_phrase('add_role');?>
                    	</a>
            </li>
                        
    	    
		</ul>
    	<!------CONTROL TABS END------>
        
	
		<div class="tab-content">
			<!-- START ALL COUNTRIES-->
			<div class="tab-pane box active" id="show_roles" style="padding: 5px">
               <div class="box-content">
					<table class="table table-striped datatable">
						<thead>
							<tr>
								<th><?=get_phrase("name");?></th>
								<th><?=get_phrase("contribution");?></th>
								<th><?=get_phrase("department");?></th>
								<th><?=get_phrase("action");?></th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($roles as $role):?>
								<tr>
									<td><?=$role->name;?></td>
									<td><?=ucfirst($role->contribution);?></td>
									<td><?php if($this->crud_model->get_type_name_by_id("role",$role->role_id)!==NULL) echo ucfirst($this->crud_model->get_type_name_by_id("role",$role->role_id));?></td>
									<td>
										 <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		                                        Action <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-default pull-right" role="menu">
		                                        
		                                        <!-- COUNTRY EDITING  -->
		                                        <li>
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_role_edit/<?php echo $role->role_id;?>');">
		                                                <i class="entypo-pencil"></i>
		                                                    <?php echo get_phrase('edit');?>
		                                                </a>
		                                        </li>
		                                        <li class="divider"></li>
		                                        
		                                        		                                        
		                                        <!-- COUNTRY DELETION  -->
		                                        <li>
		                                            <a href="#" onclick="confirm_dialog('<?php echo base_url();?>account/roles/role_delete/<?php echo $role->role_id;?>');">
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
						
			<div class="tab-pane box" id="add_role" style="padding: 5px">
               <div class="box-content padded">
					<?php 
                     	echo form_open(base_url() . 'account/roles/role_add' , array('id'=>'frm_country', 'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top' , 'enctype' => 'multipart/form-data'));
                    ?>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" required="required" placeholder="<?=get_phrase("role_title");?>"/>
                                </div>
                            </div>
                            
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('department');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control" name="department_id">
                           				<option><?=get_phrase("select");?></option>
                           				
                           				<?php 
                           					$departments = $this->crud_model->get_results_by_id("department");
											
											foreach($departments as $department):
                           				?>
                           					<option value="<?=$department->department_id;?>"><?=$department->name;?></option>
                           				
                           				<?php 
                           					endforeach;
                           				?>
                           			</select>
                           		</div>
                           </div>
                           
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('contribution');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control" name="contribution">
                           				<option><?=get_phrase("select");?></option>
                           				<option value="staff"><?=get_phrase("staff");?></option>
                           				<option value="manager"><?=get_phrase("manager");?></option>
                           			</select>
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