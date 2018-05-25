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
			
			if($entitlement->derivative_id !== 0){
				$first_parent = $this->db->get_where("entitlement",array("entitlement_id"=>$entitlement->derivative_id))->row();
			
				echo ".".$first_parent->name."{display:block;}";
				
				if($first_parent->derivative_id !== 0){
						$second_parent = $this->db->get_where("entitlement",array("entitlement_id"=>$first_parent->derivative_id))->row();
					
						echo ".".$second_parent->name."{display:block;}";
					
						if($second_parent->derivative_id !== 0){
							$third_parent = $this->db->get_where("entitlement",array("entitlement_id"=>$second_parent->derivative_id))->row();
							
								echo ".".$third_parent->name."{display:block;}";
							
						}
				}
			}
			
			
		endif;
	endforeach;
?> 

</style>