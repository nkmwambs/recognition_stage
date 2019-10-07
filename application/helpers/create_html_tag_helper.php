<?php

/**
 * select_tag: Build a select html tag with it's option and proprties
 * @param String $unit_table_name
 * @param Object $category
 * @return String: Select html tag
 */

if ( ! function_exists('select_tag'))
{
	function select_tag($unit_table_name,$category,$potential_nominees,$nominees){
			//Create an instance of Codeigniter Core Object
			$CI =& get_instance();
			
			//Creating a string to hold select tag
			$html_select_tag ='<select class="form-control nominate validate selectpicker" data-live-search="true" id="'.$category->category_id.'">';
											
			$html_select_tag .='<option value="0">'.get_phrase("no_viable_option").'</option>';
			
			if(count($nominees) > 0){
				//Creating options elements for select tag when logged in user has nominated user/teams/departments
						foreach($potential_nominees as $potential_nominee){
							$options_tag_innerhtml = "";
								if($unit_table_name === "user"){
									$options_tag_innerhtml = $potential_nominee->firstname.' '.$potential_nominee->lastname.' ['.$CI->crud_model->get_type_name_by_id("country",$potential_nominee->country_id).']';
								}else{
									$options_tag_innerhtml = $potential_nominee->name;
								}
	
								$table_primary_key_field = $unit_table_name.'_id';
								$options_value_property = 0;
								$options_selected_property = "";
	
								foreach($nominees as $result){
									if($category->category_id === $result->category_id){
										$unit_trace = $CI->crud_model->get_type_name_by_id('unit',$result->nominated_unit);
											if($unit_trace === $unit_table_name && $result->nominee_id !== '0'){
												$options_value_property = $CI->crud_model->get_type_name_by_id($unit_table_name,$result->nominee_id,$table_primary_key_field);
											}
									}
								}

								if($options_value_property === $potential_nominee->$table_primary_key_field ){
									$options_selected_property ="selected='selected'";
								}

								$html_select_tag .= '<option value="'.$potential_nominee->$table_primary_key_field.'" '.$options_selected_property.'>'.$options_tag_innerhtml.'</option>';
							}
							
					}else{
						//Creating options elements for select tag when logged in user has not nominated users/teams/departments
						foreach($potential_nominees as $potential_nominee){
							$options_tag_innerhtml = "";
								if($unit_table_name === "user"){
									$options_tag_innerhtml = $potential_nominee->firstname.' '.$potential_nominee->lastname.' ['.$CI->crud_model->get_type_name_by_id("country",$potential_nominee->country_id).']';
								}else{
									$options_tag_innerhtml = $potential_nominee->name;
								}
					
							$table_primary_key_field = $unit_table_name.'_id';
							$html_select_tag .= '<option value="'.$potential_nominee->$table_primary_key_field.'">'.$options_tag_innerhtml.'</option>';

						}

					}
			$html_select_tag .="</select>";
											
			return $html_select_tag;	
	
	}
}	

// Create selected tag for subteams added  by Onduso
if ( ! function_exists('select_tag_department_subteam'))
{
	function select_tag_department_subteam($category,$department_id,$user_id){
		
	$CI=&get_instance();
	
	//Get all the Managers in a country
    $managers = $CI->crud_model->get_managers()[$department_id];
	
	//Disable the subteam_manager_id dropdown when the department/functional team is not selected
	$disabled=$department_id==0?"disabled='disabled'":"";
		
		//Build the dropdown
		$select_option='<select class="form-control subteam" id="subteam_'.$category.'" '.$disabled.' >';
		
		$select_option .='<option value="no_subteam">'.get_phrase('select_subteam').' </option>';
		
		if($department_id>0){
	 		$select_option .= "<option value='0'>Entire Department</option>";
			
             $selected="";
			 
		    foreach ($managers as $manager_id => $team_label) {
		    	
		     //Get the selected subteam_manager_ids that is in tabulate table
		      $CI->db->join('result','result.result_id=tabulate.result_id');
		      $CI->db->join('survey','survey.survey_id=result.survey_id');
		      $tabulate_rows=$CI->db->get_where('tabulate',array('category_id'=>$category, 
		      'nominated_unit'=>2,'subteam_manager_id'=>$manager_id, 'survey.status'=>1, 'result.user_id'=>$user_id));
			  
			  //Set selected if the tabulate_rows > 0 other than reset to $selected=''
		      if($tabulate_rows->num_rows()>0){
		      	
		      	$selected='selected = "selected"';
								
		      }
			  else{
			  	$selected='';
			  }
			  
			  $select_option .= "<option  value='".$manager_id."' ".$selected." >".$team_label."</option>";
			 
		    }
		}
		
				
		$select_option .='</select>';
		
		return $select_option;
		
	}
}	

?>