<?php

$user_id = 152;

$debugger_array = array(
	'user_invite' 		=> $this->email_model->manage_account_email($user_id,'user_invite',false,'@Compassion321'),	
	'password_reset' 	=> $this->email_model->manage_account_email($user_id,'password_reset',false,'@Compassion321'),
	'survey_invite' 	=> $this->email_model->manage_account_email($user_id,'survey_invite',false),
	'survey_closure' 	=> $this->email_model->manage_account_email($user_id,'survey_closure',false),
	'vote_deletion' 	=> $this->email_model->manage_account_email($user_id,'vote_deletion',false),
	'vote_activation' 	=> $this->email_model->manage_account_email($user_id,'vote_activation',false),
	'vote_submitted' 	=> $this->email_model->manage_account_email($user_id,'vote_submitted',false),
	'vote_initiated'	=> $this->email_model->manage_account_email($user_id,'vote_initiated',false),
	'notify_nominee'	=> $this->email_model->manage_account_email($user_id,'notify_nominee',false),
	'voting_reminder'	=> $this->email_model->manage_account_email($user_id,'voting_reminder',false),
	'user_profile_edit'	=> $this->email_model->manage_account_email($user_id,'user_profile_edit',false),
	'survey_closure_due'=> $this->email_model->manage_account_email($user_id,'survey_closure_due',false)
);



?>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Template</th>
			<th>Debugged Email</th>
		</tr>
	</thead>
	<tbody>
		<?php
			foreach($debugger_array as $template_name=>$mail_content){
		?>
			<tr>
				<td><?=$template_name;?></td>
				<td><?=$mail_content;?></td>
			</tr>
		<?php
			}
		?>
	</tbody>
</table>