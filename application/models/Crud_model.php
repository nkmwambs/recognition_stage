<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Crud_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function clear_cache() {
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
    }

    function get_type_name_by_id($table_name, $primary_key = '', $field = 'name') {
        //return $this->db->get_where($type, array($type . '_id' => $type_id))->row()->$field;
        if($this->db->get_where($table_name, array($table_name . '_id' => $primary_key))->num_rows() > 0 ){
        	return $this->db->get_where($table_name, array($table_name . '_id' => $primary_key))->row()->$field;
        }else{
        	return NULL;
        }
    }
	
	
	function get_field_value($type, $search_field = '', $search_value = 'name',$show_field) {
        //return $this->db->get_where($type, array($type . '_id' => $type_id))->row()->$field;
        if($this->db->get_where($type, array($search_field => $search_value))->num_rows() > 0 ){
        	return $this->db->get_where($type, array($search_field => $search_value))->row()->$show_field;
        }else{
        	return NULL;
        }
    }
	
	
	public function get_results_by_id($type, $type_id = ''){
		$result = $this->db->get($type)->result_object();
		
		if($type_id!==""){
			$result = $this->db->get_where($type,array( $type . "_id"=>$type_id))->row();
		}
		
		return $result;
	}
	
	public function get_results_by_related_id($type, $id_field,$id,$all=false){
	
		$result = $this->db->get_where($type,array( $id_field=>$id))->row();
		if($all === true){
			$result = $this->db->get_where($type,array($id_field=>$id))->result_object();	
		}
		return $result;
	}
	
	/** PREVILEDGES **/	
	
	function admin_user($user_id=""){
		
		$is_admin = false;
		
		$this->db->where(array("type<>"=>"vote","user_id"=>$user_id));
		
		$result = $this->db->get("scope")->num_rows();
		
		if($result>0) $is_admin = true;
		
		return $is_admin; 
	}
	
	/**
	 * Scope Countries: return Array of countries ids the user has ability to vote or be 
	 * voted in or administration
	 * 
	 * @param integer user_id
	 * @param boolean show_your_country
	 * @return Array of countries ids the user has ability to vote or be voted in or administration
	 */
	function scope_countries($user_id="",$show_your_country = false){
		//Retrieve a record showing users ability to vote/ voted/admininster other countries data
		$scope = $this->db->get_where("scope",array("user_id"=>$user_id));		
		
		//Getting user resident country id
		$user_country_id = $this->db->get_where("user",array("user_id"=>$user_id))->row()->country_id;
	
		$country_ids = array();
		
		/**
		 * Add your resident country in the array $country_ids if the $show_your_country == true
		 */
		if($show_your_country === true){
			$country_ids[] = $user_country_id;
		}
		
		//If $scope->num_rows() > 0, user has ability to vote or be voted by other country users
		
		if($scope->num_rows() > 0){
			
			$countries_to_be_voted_in = $this->db->get_where("scope_country",array("scope_id"=>$scope->row()->scope_id))
			->result_object();
			
			foreach($countries_to_be_voted_in as $country){
				$country_ids[] = $country->country_id;
			}
			
		}	
				
		return $country_ids;
	}
	
	function user_teams($user_id="",$user_country_id=""){
		
		$this->db->join("teamset","teamset.team_id=team.team_id");
		$teams = $this->db->get_where("team",array("country_id"=>$user_country_id,"user_id"=>$this->session->login_user_id));
											
		return $teams->num_rows() > 0 ?  implode(",",array_column($teams->result_array(),"name")): get_phrase("teams_not_set");							
			
	}

	function scope_countries_by_name($user_id="",$show_your_country= false){
		$scope = $this->db->get_where("scope",array("user_id"=>$user_id))->row();		
	
		$user_country_id = $this->db->get_where("user",array("user_id"=>$user_id))->row()->country_id;
	
		$country_ids = array();
	
		if($show_your_country === true){
			$country_ids[] = $this->db->get_where("country",array("country_id"=>$user_country_id))->row()->name;
		}
		
		if($this->db->get_where("scope",array("user_id"=>$user_id))->num_rows() > 0){
			$this->db->join("country","country.country_id=scope_country.country_id");
			$result = $this->db->get_where("scope_country",array("scope_id"=>$scope->scope_id));
			$countries = $result->result_object();
			
			foreach($countries as $country){
				$country_ids[] = $country->name;
			}
			
		}	
				
		return $country_ids;
	}	
	
	/**
	 * country_scope_where - Builds a condition string for a query that will be used to return 
	 * countries of voters and admins
	 * @param integer user_id
	 * @param string scope_type
	 * @return String: ('country_id' = 1 or 'country_id'=>27 or 'country_id'=>n)
	 */
	
	function country_scope_where($user_id="",$scope_type = "vote"){

		$country_ids =  array();
		
		/**
		 * If the scope type == to admin, list only your country of residence. 
		 * This is used in the nominate view to filter only users of the logged user contry during 
		 * nomination and administrating your country's system settings.
		 * ELSE
		 * If scope type == both or vote, all the countries that you have a scope are listed. 
		 * It's used in the nomination view to list all users from all contries.
		 * Both allows you to vote and do administration for the countries.
		 */
		
		if($scope_type === "admin"){
			 $country_ids[0] = $this->session->country_id;
		}else{
		
			$country_ids = $this->crud_model->scope_countries($user_id,true);
		}
			/**
			 * Building a condition string for a query based on scope 
			* countries set when the scope type is either admin or vote/both 
			 */
			
			$scope_cond = '(';
			$cnt = 1;
				foreach($country_ids as $country_id){
					
					if($cnt === count($country_ids)){
						/**
					 	* Turn true when your scope type is admin or last loop instance 
					 	* when count == size of array of country ids
					 	*/
						$scope_cond  .= "country_id = ".$country_id.")";
					}elseif($cnt !== count($country_ids)){
						/**
						 * Turn true when your scope type is vote/both but in the first to n-1 loop
					 	*/
						$scope_cond  .= "country_id = ".$country_id." or ";	
					}
																
				$cnt++;
			}
															
		return $scope_cond;													

	}
	

	
	public function get_entitlement_by_profile_id($profile_id=""){
		
		return $this->db->get_where("access",array("profile_id"=>$profile_id))->result_object();
		
	}
	
	public function check_profile_privilege($profile_id,$privilege=""){
		
		$entitlements = $this->get_entitlement_by_profile_id($profile_id);
		
		$new_array = array();
		
		foreach($entitlements as $entitlement){
			$new_array[] = $this->db->get_where("entitlement",array("entitlement_id"=>$entitlement->entitlement_id))->row()->name;
		}
		
		return in_array($privilege, $new_array) == "1"?true:false;
		
	}
	
	function user_teams_to_vote($user_id=""){
		$scope_cond = "";
		$user_country = $this->db->get_where("user",array("user_id"=>$user_id))->row()->country_id;
		
		$team_ids = array();
		
		if($this->db->get_where("teamset",array("user_id<>"=>$user_id))->num_rows() > 0){
		
			$country_teams = $this->db->get_where("team",array("country_id"=>$user_country));
			
			if($country_teams->num_rows() > 0){
				
				foreach($country_teams->result_object() as $team){
					
					if($this->db->get_where("teamset",array("user_id"=>$user_id,"team_id"=>$team->team_id))->num_rows() === 0){
						$team_ids[] = $team->team_id;
					}
				}
				
				
			}
			
			
			$scope_cond .= '(';
			$cnt = 1;
				foreach($team_ids as $team_id){
					// $this->db->where(array("country_id"=>$country_id));
					if($cnt === count($team_ids)){
						$scope_cond  .= "team_id = ".$team_id.")";
					}elseif($cnt === 1 && $cnt !== count($team_ids)){
						$scope_cond  .= "team_id = ".$team_id." or ";	
					}else{
						$scope_cond  .= "team_id = ".$team_id." or ";
					}
																
				$cnt++;
			}
															
		 $scope_cond .= '';
			
		}
		return $scope_cond;	
	} 
	
	/**
	 * users_with_country_scope_for_voting: Returns a condition string for query with users ids
	 * @param Integer country_id
	 * @return String
	 */
	
	function users_with_country_scope_for_voting($country_id=""){
		
		/**
		 * Get records from user ids from scope table. 
		 * The users should have a contry scope equal to the passed argument in the scope country table
		 */
		$this->db->select(array('scope.user_id'));
		$this->db->join('user','user.user_id=scope.user_id'); 
		$this->db->join('scope_country','scope_country.scope_id=scope.scope_id');
		$user_ids = $this->db->get_where("scope",array("scope_country.country_id"=>$country_id,
		"two_way"=>1,"type<>"=>"admin",'user.auth'=>1))->result_object();
		
		/**
		 * Loop the users as you build query string 
		 */
		$scope_cond = '(';
			$cnt = 1;
				foreach($user_ids as $user){
					if($cnt === count($user_ids)){
						$scope_cond  .= "user_id = ".$user->user_id.")";
					}elseif($cnt !== count($user_ids)){
						$scope_cond  .= "user_id = ".$user->user_id." or ";	
					}
																
				$cnt++;
			}
															
		
	
		return $scope_cond;
	} 
	
	/**
	 * Scope categories_in_grouping: return Array of Categories grouped per grouping 
	 * ex. Staff Category, Manager Recognition group
	 * 
	 * @param integer $grouping_id
	 * @param integer $user_id
	 * @param integer $staff_position
	 * @return return Array of Categories grouped per grouping 
	 * ex. Staff Category, Manager Recognition group
	 */

	function categories_in_grouping($user_id="",$staff_position=""){
		
		$show_categories = array();
		
		$user_country = $this->session->country_id;
		
		/**
		 * A Where condintion string to be used in the db query
		 */	
		$condition_string = " status = 1 AND visibility IN (1,$user_country)";	
								
		/**
		 * Appends staff position to Where condintion string where the user is a staff
		 */
		if($staff_position == 1){
			$condition_string .= " AND assignment = $staff_position";				
		}
		
		//A query to return categories	
		$this->db->where($condition_string);
		$categories = $this->db->get("category"); 
		
		/**
		 * Checks if the there are categories and create an array of categories grouped by groups
		 */		

		if($categories->num_rows() > 0){
			//Get categories grouped in groups ex. Staff Categories
			foreach($categories->result_object() as $category){
				$show_categories[$category->grouping_id][] = $category;
			}
		}
	
		return $show_categories;
	}
	
	    
    ////////BACKUP RESTORE/////////
    function create_backup($type) {
        $this->load->dbutil();


        $options = array(
            'format' => 'txt', // gzip, zip, txt
            'add_drop' => TRUE, // Whether to add DROP TABLE statements to backup file
            'add_insert' => TRUE, // Whether to add INSERT data to backup file
            'newline' => "\n"               // Newline character used in backup file
        );


        if ($type == 'all') {
            $tables = array('');
            $file_name = 'system_backup';
        } else {
            $tables = array('tables' => array($type));
            $file_name = 'backup_' . $type;
        }

        $backup = & $this->dbutil->backup(array_merge($options, $tables));


        $this->load->helper('download');
        force_download($file_name . '.sql', $backup);
    }
	
	


    /////////RESTORE TOTAL DB/ DB TABLE FROM UPLOADED BACKUP SQL FILE//////////
    function restore_backup() {
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/backup.sql');
        $this->load->dbutil();


        $prefs = array(
            'filepath' => 'uploads/backup.sql',
            'delete_after_upload' => TRUE,
            'delimiter' => ';'
        );
        $restore = & $this->dbutil->restore($prefs);
        unlink($prefs['filepath']);
    }

    /////////DELETE DATA FROM TABLES///////////////
    function truncate($type) {
        if ($type == 'all') {
            $this->db->truncate('student');
            $this->db->truncate('mark');
            $this->db->truncate('teacher');
            $this->db->truncate('subject');
            $this->db->truncate('class');
            $this->db->truncate('exam');
            $this->db->truncate('grade');
        } else {
            $this->db->truncate($type);
        }
    }

    ////////IMAGE URL//////////
    function get_image_url($id = '') {
        if (file_exists('uploads/user_image/' . $id . '.jpg'))
            $image_url = base_url() . 'uploads/user_image/' . $id . '.jpg';
        else
            $image_url = base_url() . 'uploads/user.jpg';

        return $image_url;
    }

       ////////private message//////
    function send_new_private_message() {
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));

        $reciever   = $this->input->post('reciever');
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        //check if the thread between those 2 users exists, if not create new thread
        $num1 = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->num_rows();
        $num2 = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->num_rows();

        if ($num1 == 0 && $num2 == 0) {
            $message_thread_code                        = substr(md5(rand(100000000, 20000000000)), 0, 15);
            $data_message_thread['message_thread_code'] = $message_thread_code;
            $data_message_thread['sender']              = $sender;
            $data_message_thread['reciever']            = $reciever;
            $this->db->insert('message_thread', $data_message_thread);
        }
        if ($num1 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->row()->message_thread_code;
        if ($num2 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->row()->message_thread_code;


        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);

        // notify email to email reciever
        //$this->email_model->notify_email('new_message_notification', $this->db->insert_id());

        return $message_thread_code;
    }

    function send_reply_message($message_thread_code) {
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');


        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);

        // notify email to email reciever
        //$this->email_model->notify_email('new_message_notification', $this->db->insert_id());
    }

    function mark_thread_messages_read($message_thread_code) {
        // mark read only the oponnent messages of this thread, not currently logged in user's sent messages
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $this->db->where('sender !=', $current_user);
        $this->db->where('message_thread_code', $message_thread_code);
        $this->db->update('message', array('read_status' => 1));
    }

    function count_unread_message_of_thread($message_thread_code) {
        $unread_message_counter = 0;
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $messages = $this->db->get_where('message', array('message_thread_code' => $message_thread_code))->result_array();
        foreach ($messages as $row) {
            if ($row['sender'] != $current_user && $row['read_status'] == '0')
                $unread_message_counter++;
        }
        return $unread_message_counter;
    }
	
	/**USER PREVILEDGES**/
	
	function user_privilege($param1="",$privilege=""){
		
		$user_previledges = array();
		$arr = $this->db->join("entitlement","entitlement.entitlement_id=access.entitlement_id")->get_where('access',array("profile_id"=>$param1))->result_object();
			
		foreach($arr as $row){
			$user_previledges[] = $row->name;
		}
		
		return in_array($privilege, $user_previledges) ? true : false; 

	}
}
