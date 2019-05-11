<?php
	$staffs = $this->db->get_where("user",array("manager_id"=>$param2,'auth'=>1))->result_object();
?>
<div class="row">
	<div class="col-md-12 inner-progress"></div>
	
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
        	<div class="panel-heading">
            	<div class="panel-title" >
            		<i class="entypo-users"></i>
					<?php echo get_phrase('staff');?>
            	</div>
            </div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><?=get_phrase('name');?></th>
							<th><?=get_phrase('role');?></th>
							<th><?=get_phrase('country');?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach($staffs as $staff){
						?>
							<tr>
								<td><?=$staff->firstname;?> <?=$staff->lastname;?></td>
								<td><?=$this->crud_model->get_type_name_by_id('role',$staff->role_id);?></td>
								<td><?=$this->crud_model->get_type_name_by_id('country',$staff->country_id);?></td>
							</tr>
						<?php
						}
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>				
				