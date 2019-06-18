<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reminders extends CI_Controller {
	public function __construct() {
		parent::__construct(); 
		$this->load->database();
    	$this->load->library('email');
    	$this->load->model('Email_model');
		$this->load->helper("multi_language");
  	}
  	
  	public function index(){
    	if(!is_cli())
	  	{
	     	echo "This script can only be accessed via the command line" . PHP_EOL;
	      	return;
	  	}
	  	
			//Get All Active Users whose notify email is set to on and have not
			$users  = $this->db->get_where("user",array("auth"=>1,"email_notify"=>1))->result_object();  
			
			foreach($users as $user){
				$this->reminder_notification($user->user_id,'survey_invite');
			}
			
	          
  	}
  
  
  	function reminder_notification($user_id="",$template_trigger=""){

		
		//Number of days to end of survey
		$active_survey_obj = $this->db->get_where('survey',array('status'=>1));
		
		/**No longer used to send survey invites. This code has been replaced with a send_batch_email model used
		 * in the the Surveys/survey_check_on_insert callback method of the Surveys/survey_setting **/
		 
		// if(date("Y-m-d",strtotime($active_survey_obj->row()->start_date)) === date("Y-m-d")){
			// $this->email_model->manage_account_email($user_id,'survey_invite',true);
		// }
		
		
		$datetime1 = date_create(date('Y-m-d'));
		$datetime2 = date_create($active_survey_obj->row()->end_date);
		$interval = date_diff($datetime1, $datetime2);
		
		$days_to_go = $interval->format('%r%a');
		
		//Get cron templates
		$this->db->join('template','template.template_id=notify_cron.template_id');
		$cron_times = $this->db->get_where('notify_cron',array('status'=>1));
		
		
		
		if($cron_times->num_rows() > 0){
			foreach($cron_times->result_object() as $cron){
				
				if($cron->days_to_closure == $days_to_go || $cron->days_to_closure  == -1){
					
					if($cron->notify_based_on_vote_not_submitted == 0){
						$this->email_model->manage_account_email($user_id,$cron->template_trigger,true);
					}else{
						$check_unsubmitted_vote = $this->db->get_where('result',
						array('user_id'=>$user_id,'survey_id'=>$active_survey_obj->row()->survey_id,'status'=>0));
						
						if($check_unsubmitted_vote->num_rows() > 0){
							$this->email_model->manage_account_email($user_id,$cron->template_trigger,true);
						}
					}
					
				}elseif($days_to_go < 0 && $active_survey_obj->num_rows()>0){		
					//$this->crud_model->auto_create_new_survey();
				}
				
			}
		}
		
 	}
  	
}