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
	

?>