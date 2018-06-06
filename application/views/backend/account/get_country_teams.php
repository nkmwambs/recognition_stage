<?php 
$option = "<option value=''>".get_phrase('select')."</option>"; 
foreach($teams as $team){

	$option .= "<option value='".$team->name."'>".$team->name."</option>";
   	
}

echo $option;

?>