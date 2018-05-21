<?php 
$edit_data		=	$this->db->get_where('team' , array('team_id' => $param2) )->result_object();
foreach ( $edit_data as $row):
?>
<div class="row">
	<!--Showing Progress GIF. Must be available in evert form-->
	<div class="col-md-12 inner-progress"></div>
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-plus-circled"></i>
					<?php echo get_phrase('edit_department');?>
            	</div>
            </div>
			<div class="panel-body">
                    <?php echo form_open(base_url() . 'account/teams/team_edit/'.$row->team_id , array('id'=> 'frm_edit_country',  'class' => 'form-horizontal form-groups-bordered validate','target'=>'_top', 'enctype' => 'multipart/form-data'));?>
                                                            
                           <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('team');?></label>
                                <div class="col-sm-5">
                                    <input type="text"  class="form-control" name="name" value="<?=$row->name;?>" required="required" placeholder="<?=get_phrase("team_title");?>"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('country');?></label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="country_id">
                                    	<option><?=get_phrase("select")?></option>
                                    	<?php 
                                    		$countries = $this->crud_model->get_results_by_id("country");
                                    		foreach($countries as $country):
                                    	?>
                                    		<option value="<?=$country->country_id;?>" <?php if($country->country_id === $row->country_id)  echo "selected";?>><?=$country->name;?></option>
                                    	<?php endforeach;?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><?php echo get_phrase('description');?></label>
                                <div class="col-sm-5">
                                    <textarea  class="form-control" name="description" required="required" placeholder="<?=get_phrase("description")?>"><?=$row->description;?></textarea>`
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