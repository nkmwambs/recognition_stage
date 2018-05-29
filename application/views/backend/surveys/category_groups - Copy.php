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
            	<a href="#show_grouping" data-toggle="tab"><i class="entypo-logo-db"></i> 
					<?php echo get_phrase('grouping');?>
                    	</a>
            </li>
			
			<li class="">
            	<a href="#add_grouping" data-toggle="tab"><i class="entypo-plus"></i> 
					<?php echo get_phrase('add_grouping');?>
                    	</a>
            </li>
                        
    	    
		</ul>
    	<!------CONTROL TABS END------>
        
	
		<div class="tab-content">
			<!-- START ALL COUNTRIES-->
			<div class="tab-pane box active" id="show_grouping" style="padding: 5px">
               <div class="box-content">
					<table class="table table-striped datatable">
						<thead>
							<tr>
								<th><?=get_phrase("name");?></th>
								<th><?=get_phrase("description");?></th>
								<th><?=get_phrase("status");?></th>
								<th><?=get_phrase("action");?></th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($groupings as $grouping):?>
								<tr>
									<td><?=$grouping->name;?></td>
									<td><?=$grouping->description;?></td>
									<td><?=$grouping->status === '1'?get_phrase("active"):get_phrase("inactive");?></td>
									<td>
										 <div class="btn-group">
		                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		                                        Action <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-default pull-right" role="menu">
		                                        
		                                        <!-- GROUP VIEW  -->
		                                        <li>
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_view_grouping/<?php echo $grouping->grouping_id;?>');">
		                                                <i class="entypo-eye"></i>
		                                                    <?php echo get_phrase('view');?>
		                                                </a>
		                                        </li>
		                                        
		                                        <li class="divider"></li>
		                                        <!-- GROUP EDITING  -->
		                                        <li class="edit_grouping">
		                                            <a href="#" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_grouping_edit/<?php echo $grouping->grouping_id;?>');">
		                                                <i class="entypo-pencil"></i>
		                                                    <?php echo get_phrase('edit');?>
		                                                </a>
		                                        </li>
		                                        
		                                        <li class="divider edit_grouping"></li>
		                                        		                                        
		                                        <!-- GROUP DELETION  -->
		                                        <li class="delete_grouping">
		                                            <a href="#" onclick="confirm_action('<?php echo base_url();?>surveys/category_groups/grouping_delete/<?php echo $grouping->grouping_id;?>');">
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
						
			<div class="tab-pane box" id="add_grouping" style="padding: 5px">
               <div class="box-content padded add_grouping">
					<?php 
                     	echo form_open(base_url() . 'surveys/category_groups/grouping_add' , array('id'=>'frm_grouping', 'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top' , 'enctype' => 'multipart/form-data'));
                    ?>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('name');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" required="required" placeholder="<?=get_phrase("title");?>"/>
                                </div>
                            </div>
                            
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('description');?></label>
                           		<div class="col-sm-5">
                           			<textarea class="form-control" name="description" placeholder="<?=get_phrase("description");?>"></textarea>	
                           		</div>
                           </div>
                           
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('status');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control" name="status">
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