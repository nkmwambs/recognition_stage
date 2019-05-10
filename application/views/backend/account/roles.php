<?php 
//The varriables are used here all are comming from the grocery crud library thru render()method and not from controller directly
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

<div class="row">
	<div class="col-sm-12">
		<?php echo $output; ?>
	</div>
</div>
<script>
//Hide the onload these fields: last_line_manager_field_box, vote_all_in_user_scope_field_box, is_bt_role_field_box
	$(document).ready(function(){
		$('#field-last_line_manager, #field-vote_all_in_user_scope').addClass('last_line_vote_all');
		$('#last_line_manager_field_box, #vote_all_in_user_scope_field_box, #is_bt_role_field_box').addClass('special_settings');
		
		if($('#field-contribution').val() == 1){
			$('.special_settings').css('display','none');
		})
			
	});
	
	/*Trigger the display of the hide fields:last_line_manager_field_box, 
	vote_all_in_user_scope_field_box, is_bt_role_field_box when contribution*/
	
	$('#field-contribution').on('change',function(ev){
		var contribution_val=$(this).val();
		if(contribution_val==2)
		{
		  $('.special_settings').css('display','block');	
		}
		else{
			$('.special_settings').css('display','none');
		}
	});
	
	//
	$('#field-last_line_manager, #field-vote_all_in_user_scope').change(function(ev){
		//alert($(this).val());
		var last_line_manager=$('#field-last_line_manager').val();
		var vote_all_in_user_scope=$('#field-vote_all_in_user_scope').val();
		
		if(last_line_manager==2 && vote_all_in_user_scope==2)
		{
			
			$(this).css('border','1px red solid');
			
			//Reset to default values of last line manager=1 and cannot vote across
			$('#field-last_line_manager').val('2');
			$('#field-vote_all_in_user_scope').val('1');
			
			alert('Last line manager can not be allowed to vote across departments');
			
		}
		
	});
</script>