<div class="btn-group">
	<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
		Action <span class="caret"></span>
	</button>
			<ul class="dropdown-menu dropdown-default pull-left" role="menu">
			     <li class="">
			         <a href="#users" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_view_account/<?php echo $user->user_id;?>');">
			                <i class="entypo-eye"></i>
			                    <?php echo get_phrase('view');?>
			         </a>
			      </li>
			      <li class="divider"></li>
			      
			      <?php 
			      	if($this->db->get_where('role',array('contribution'=>2,'role_id'=>$user->role_id))->num_rows() > 0){
			      ?>
			      <li class="">
			         <a href="#users" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_show_staff/<?php echo $user->user_id;?>');">
			                <i class="entypo-users"></i>
			                    <?php echo get_phrase('show_staff');?>
			         </a>
			      </li>
			      <li class="divider"></li>
					<?php
					}
					?>			
			      <!-- USER EDITING  -->
			      <li class="edit_user">
			          <a href="<?=base_url();?>account/edit_user/<?php echo $user->user_id;?>"
			              	<i class="entypo-pencil"></i>
			                    <?php echo get_phrase('edit');?>
			          </a>
			      </li>
			      <li class="divider update_user"></li>

			      <li class="change_scope">
			            <a href="#users" onclick="showAjaxModal('<?php echo base_url();?>modal/popup/modal_scope_assignment/<?php echo $user->user_id;?>');">
			               <i class="entypo-level-down"></i>
			                   <?php echo get_phrase('change_scope');?>
			            </a>
			      </li>
			      <li class="divider change_scope"></li>


			      <!-- SUSPEND USER  -->
			      <li class="suspend_user">
			      		<a  href="#users" onclick="confirm_action('<?php echo base_url();?>account/manage_users/user_suspend/<?php echo $user->user_id;?>');">
			                 <i class="<?php if($user->auth === '1' ){echo "entypo-cancel";}else{echo "entypo-check";};?>"></i>
			                        <?php if($user->auth === '1') {echo get_phrase('suspend');}else{echo  get_phrase('activate');};?>
			                 </a>
			       </li>

			      <!-- <li class="divider suspend_user"></li> -->

			      <!-- USER DELETION  -->
			      <!-- <li class="delete_user" > -->
			          <!-- <a href="#users" onclick="confirm_dialog('<?php echo base_url();?>account/manage_users/user_delete/<?php echo $user->user_id;?>');"> -->
			               <!-- <i class="entypo-trash"></i> -->
			                    <!-- <?php echo get_phrase('delete');?> -->
			          <!-- </a> -->
			      <!-- </li> -->
		</ul>
</div>