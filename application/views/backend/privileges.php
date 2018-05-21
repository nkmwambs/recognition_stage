<style>
<?php
	$entitlements = $this->db->get("entitlement")->result_object();
	
	foreach($entitlements as $entitlement):
?>
	
	.<?=$entitlement->name;?>{display:none;}

<?php 
	endforeach;

	foreach($entitlements as $entitlement):
		if($this->crud_model->user_privilege($this->session->profile_id,$entitlement->name)):
?>
			.<?=$entitlement->name;?>{display:block;}
	 	
<?php 
		endif;
	endforeach;
?> 

</style>