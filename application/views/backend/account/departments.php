<div class="row">

	<div class="col-md-12">
    
    	<!------CONTROL TABS START------>
		<ul class="nav nav-tabs bordered">

			<li class="active">
            	<a href="#show_departments" data-toggle="tab"><i class="entypo-progress-3"></i> 
					<?php echo get_phrase('departments');?>
                    	</a>
            </li>
			
			<li class="">
            	<a href="#add_department" data-toggle="tab"><i class="entypo-plus"></i> 
					<?php echo get_phrase('add_department');?>
                    	</a>
            </li>
                        
    	    
		</ul>
    	<!------CONTROL TABS END------>
        
	
		<div class="tab-content">
			<!-- START ALL COUNTRIES-->
			<div class="tab-pane box active" id="show_departments" style="padding: 5px">
               <div class="box-content">
					<table class="table table-striped datatable">
						<thead>
							<tr>
								<th><?=get_phrase("name");?></th>
								<th><?=get_phrase("action");?></th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($departments as $department):?>
								<tr>
									<td><?=$department->name;?></td>
									<td>
										 <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		                                        Action <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-default pull-right" role="menu">
		                                        
		                                        <!-- COUNTRY EDITING  -->
		                                        <li>
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_department_edit/<?php echo $department->department_id;?>');">
		                                                <i class="entypo-pencil"></i>
		                                                    <?php echo get_phrase('edit');?>
		                                                </a>
		                                        </li>
		                                        <li class="divider"></li>
		                                        
		                                        		                                        
		                                        <!-- COUNTRY DELETION  -->
		                                        <li>
		                                            <a href="#" onclick="confirm_dialog('<?php echo base_url();?>account/departments/department_delete/<?php echo $department->department_id;?>');">
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
						
			<div class="tab-pane box" id="add_department" style="padding: 5px">
               <div class="box-content padded">
					<?php 
                     	echo form_open(base_url() . 'account/departments/department_add' , array('id'=>'frm_country', 'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top' , 'enctype' => 'multipart/form-data'));
                    ?>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('department');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" required="required"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <button class="btn btn-info btn-icon submit"><i class="fa fa-save"></i><?php echo get_phrase('save');?></button>
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