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
	function select_tag_department_subteam($category,$user_tabulated_votes){
	
	$CI=&get_instance();
	
	/*Get array column of category_id and nominee_ids and then combine them with array combine them to 
	 * create an of of keys being category_id and the value is nominee_id (array([category_id]=>nominee_id))
	*/
	$category_id_arr=array_column($user_tabulated_votes, 'category_id');

    $nominee_id_arr=array_column($user_tabulated_votes, 'nominee_id');

	$nominees_per_category=array_combine($category_id_arr, $nominee_id_arr);
	
	
	//Check if the manager_id exists as the key and then build the $managers array()
	$department_id=0;
	
	$managers=array();
	
	if(array_key_exists($category, $nominees_per_category)){
		
		$department_id=$nominees_per_category[$category];
		
		//Get all the Managers in a country
        $managers = $CI->crud_model->get_managers()[$department_id];
	}
	
		//Disable the subteam_manager_id dropdown when the department/functional team is not selected
		$disabled=$department_id==0?"disabled='disabled'":"";
		
		//Build the dropdown
		$select_option='<select class="form-control subteam" id="subteam_'.$category.'" '.$disabled.' >';
		
		$select_option .="<option value='-1' ".$subteam_selected.">".get_phrase('select_subteam')." </option>";
				
		if($department_id>=0){
			
            $selected="";
			
			$count=0;
			
			//Loop to build the dropdown of subteams  based on the selected manager_id in nominate dropdown
		    foreach ($managers as $manager_id => $team_label) 
		    {
		    		
		     //Query the manager id zero record	
		     $query_manager_id_zero=array();
			 $CI->db->select(array('subteam_manager_id'));
		     $query_manager_id_zero=$CI->db->get_where('tabulate',array('nominated_unit'=>2, 'subteam_manager_id'=>0,'created_by'=>$CI->session->login_user_id,'category_id'=>$category))->result_array();
		    			    	
		     //Get the selected subteam_manager_ids that is in tabulate table
		      $CI->db->join('result','result.result_id=tabulate.result_id');
		      $CI->db->join('survey','survey.survey_id=result.survey_id');
		      $tabulate_rows=$CI->db->get_where('tabulate',array('category_id'=>$category, 
		      'nominated_unit'=>2,'subteam_manager_id'=>$manager_id, 'survey.status'=>1, 'result.user_id'=>$CI->session->login_user_id));
			  
			  //Set selected if the tabulate_rows > 0 other than reset to $selected=''
			  $selected=$tabulate_rows->num_rows()>0?'selected = "selected"':'';		  
		
		      //Create Entire_department option of the dropdown either selected or not
			  if(!empty($query_manager_id_zero) && $query_manager_id_zero[0]['subteam_manager_id']==0 && $count==0){
			  	
			  	$count++;
			  	$select_option .= "<option  selected='selected' value='".$query_manager_id_zero[0]['subteam_manager_id']."'>Entire Department</option>";
			  }
			  else if($count==0){
			  	
				$count++;
			  	$select_option .= "<option  value='0'>Entire Department</option>";
			  }	
			  		
			  $select_option .= "<option  value='".$manager_id."' ".$selected." >".$team_label."</option>";
			 
		    }
		}
	
		$select_option .='</select>';
		
		return $select_option;
		
	}
}	

?>