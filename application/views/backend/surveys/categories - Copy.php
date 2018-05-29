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
            	<a href="#show_categories" data-toggle="tab"><i class="entypo-layout"></i> 
					<?php echo get_phrase('categories');?>
                    	</a>
            </li>
			
			<li class="">
            	<a href="#add_categories" data-toggle="tab"><i class="entypo-plus"></i> 
					<?php echo get_phrase('add_categories');?>
                    	</a>
            </li>
                        
    	    
		</ul>
    	<!------CONTROL TABS END------>
        
	
		<div class="tab-content">
			<!-- START ALL COUNTRIES-->
			<div class="tab-pane box active" id="show_categories" style="padding: 5px">
               <div class="box-content">
					<table class="table table-striped datatable">
						<thead>
							<tr>
								<th><?=get_phrase("name");?></th>
								<th><?=get_phrase("grouping");?></th>
								<th><?=get_phrase("visibility");?></th>
								<th><?=get_phrase("assignment");?></th>
								<th><?=get_phrase("status");?></th>
								<th><?=get_phrase("action");?></th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($categories as $category):?>
								<tr>
									<td><?=$category->name;?></td>
									<td><?=$category->grouping_id;?></td>
									<td><?=$category->visibility;?></td>
									<td><?=$category->assignment;?></td>
									<td><?=$category->status === '1'?get_phrase("active"):get_phrase("inactive");?></td>
									<td>
										 <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		                                        Action <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-default pull-right" role="menu">
		                                        
		                                        <!-- GROUP VIEW  -->
		                                        <li>
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_view_category/<?php echo $category->category_id;?>');">
		                                                <i class="entypo-eye"></i>
		                                                    <?php echo get_phrase('view');?>
		                                                </a>
		                                        </li>
		                                        
		                                        <li class="divider"></li>
		                                        <!-- GROUP EDITING  -->
		                                        <li class="edit_category">
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_category_edit/<?php echo $category->category_id;?>');">
		                                                <i class="entypo-pencil"></i>
		                                                    <?php echo get_phrase('edit');?>
		                                                </a>
		                                        </li>
		                                        
		                                        <li class="divider edit_grouping"></li>
		                                        		                                        
		                                        <!-- GROUP DELETION  -->
		                                        <li class="delete_category">
		                                            <a href="#" onclick="confirm_action('<?php echo base_url();?>surveys/category_groups/category_delete/<?php echo $category->category_id;?>');">
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
						
			<div class="tab-pane box" id="add_categories" style="padding: 5px">
               <div class="box-content padded add_grouping">
					<?php 
                     	echo form_open(base_url() . 'surveys/categories/category_add' , array('id'=>'frm_grouping', 'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top' , 'enctype' => 'multipart/form-data'));
                    ?>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('name');?></label>
                                <div class="col-sm-5">
                                    <textarea class="form-control" name="name" placeholder="<?=get_phrase("description");?>"></textarea>	
                                </div>
                            </div>
                            
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('grouping');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control select2" name="grouping_id">
                           				<option><?=get_phrase('select');?></option>
                           				<?php 
                           					$groupings = $this->crud_model->get_results_by_id("grouping");
											
											foreach($groupings as $grouping):	
                           				?>
                           					<option value="<?=$grouping->grouping_id;?>"><?=$grouping->name;?></option>
                           				<?php 
					                        endforeach;			
                           				?>
                           			</select>
                           		</div>
                           </div>
                           
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('user_type_assignment');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control select2" name="assignment">
                           				<option><?=get_phrase("select");?></option>
                           				<option value="staff"><?=get_phrase("peer");?></option>
                           				<option value="manager" selected="selected"><?=get_phrase("manager");?></option>
                           			</select>
                           		</div>
                           </div>
                           
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('country_visibility');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control select2" name="visibility">
                           				<option value="0"><?=get_phrase('all_countries');?></option>
                           				<?php 
                           					$countries = $this->crud_model->get_results_by_id("country");
											
											foreach($countries as $country):	
                           				?>
                           					<option value="<?=$country->country_id;?>"><?=$country->name;?></option>
                           				<?php 
					                        endforeach;			
                           				?>
                           			</select>
                           		</div>
                           </div>
                           
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('status');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control select2" name="status">
                           				<option><?=get_phrase("select");?></option>
                           				<option value="0"><?=get_phrase("inactive");?></option>
                           				<option value="1" selected="selected"><?=get_phrase("active");?></option>
                           			</select>
                           		</div>
                           </div>
                            
                            <div class="form-group">
                              <div class="col-sm-offset-3 col-sm-5">
                                  <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-save"></i><?php echo get_phrase('save');?></button>
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