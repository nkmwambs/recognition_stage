<?php 
$edit_data		=	$this->db->get_where('department' , array('department_id' => $param2) )->result_object();
foreach ( $edit_data as $row):
?>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-plus-circled"></i>
					<?php echo get_phrase('edit_department');?>
            	</div>
            </div>
			<div class="panel-body">
                    <?php echo form_open(base_url() . 'account/departments/department_edit/'.$row->department_id , array('id'=> 'frm_edit_department',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('name');?></label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="name" value="<?php echo $row->name;?>"/>
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
    </div>
</div>

<?php
endforeach;
?>

<script>
$("#test").click(function(){})

</script>