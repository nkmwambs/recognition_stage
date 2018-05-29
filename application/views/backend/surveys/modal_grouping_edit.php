<?php 
$edit_data		=	$this->db->get_where('grouping' , array('grouping_id' => $param2) )->result_object();
foreach ( $edit_data as $row):
?>
<div class="row">
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-plus-circled"></i>
					<?php echo get_phrase('edit_grouping');?>
            	</div>
            </div>
			<div class="panel-body">
                    <?php echo form_open(base_url() . 'surveys/category_groups/grouping_edit/'.$row->grouping_id , array('id'=> 'frm_edit_grouping',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('role');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" value="<?=$row->name;?>" required="required" placeholder="<?=get_phrase("role_title");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('description');?></label>
                                <div class="col-sm-5">
                                    <textarea  class="form-control" name="description"  required="required" placeholder="<?=get_phrase("description");?>"><?=$row->description;?></textarea>
                                </div>
                            </div>
                            
                           <div class="form-group">
                           		<label class="col-sm-3 control-label"><?php echo get_phrase('status');?></label>
                           		<div class="col-sm-5">
                           			<select class="form-control" name="status">
                           				<option><?=get_phrase("select");?></option>
                           				<option value="0" <?php if($row->status=='0') echo "selected";?> ><?=get_phrase("inactive");?></option>
                           				<option value="1" <?php if($row->status=='1') echo "selected"; else echo "selected";?> ><?=get_phrase("active");?></option>
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
    </div>
</div>

<?php
endforeach;
?>

<script>


</script>