<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*	
 *	@author 	: Joyonto Roy
 *	date		: 27 september, 2014
 *	FPS School Management System Pro
 *	http://codecanyon.net/user/FreePhpSoftwares
 *	support@freephpsoftwares.com
 */

class Account extends CI_Controller
{
    
    
	function __construct()
	{
		parent::__construct();
		$this->load->database();
        $this->load->library('session');
		
		/** System Feature Session Tag **/
		$this->session->set_userdata('view_type', get_called_class());
		
       /*cache control*/
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		
    }
    
    /***default functin, redirects to login page if no admin logged in yet***/
    public function index()
    {
        if ($this->session->userdata('user_login') != 1)
            redirect(base_url() . 'login', 'refresh');
    }
	
	/** AJAX LOADED CONTENT START**/
	
	public function countries($param1="",$param2=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url() . 'login', 'refresh');
		
		$page_data['msg'] = get_phrase("success");
		
		
		if($param1==="country_add"){
			$data["name"] = $this->input->post("name");
			
			if($this->db->get_where("country",array("name"=>$this->input->post("name")))->num_rows() > 0){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->insert("country",$data);
			}
			
			$page_data['countries'] = $this->db->get("country")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="country_edit"){
			$data["name"] = $this->input->post("name");
			
			if($this->db->get_where("country",array("name"=>$this->input->post("name")))->num_rows() > 1){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->where(array("country_id"=>$param2));
				$this->db->update("country",$data);
			}
			
			$page_data['countries'] = $this->db->get("country")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="country_delete"){
			$this->db->where(array("country_id"=>$param2));
			$this->db->delete("country");
			
			$page_data['countries'] = $this->db->get("country")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		
		$page_data['countries'] = $this->db->get("country")->result_object();
        $page_data['page_name']  = __FUNCTION__;
        $page_data['view_type']  = get_called_class();
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$this->load->view('backend/index', $page_data);
	}
    
    public function departments($param1="",$param2="",$param3=""){
    	if ($this->session->userdata('user_login') != 1)
            redirect(base_url() . 'login', 'refresh');
		
		
		$page_data['msg'] = get_phrase("success");
		
		
		if($param1==="department_add"){
			$data["name"] = $this->input->post("name");
			
			if($this->db->get_where("department",array("name"=>$this->input->post("name")))->num_rows() > 0){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->insert("department",$data);
			}
			
			$page_data['departments'] = $this->db->get("department")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="department_edit"){
			$data["name"] = $this->input->post("name");
			
			if($this->db->get_where("department",array("name"=>$this->input->post("name")))->num_rows() > 1){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->where(array("department_id"=>$param2));
				$this->db->update("department",$data);
			}
			
			$page_data['departments'] = $this->db->get("department")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="department_delete"){
			$this->db->where(array("department_id"=>$param2));
			$this->db->delete("department");
			
			$page_data['departments'] = $this->db->get("department")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}
		
		$page_data['departments'] = $this->db->get("department")->result_object();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['view_type']  = get_called_class();
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$this->load->view('backend/index', $page_data);
	}   
	
	public function profiles($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
	            redirect(base_url() . 'login', 'refresh');
			
			$page_data['msg'] = get_phrase("success");
			
			
			if($param1==="profile_add"){
				$data["name"] = $this->input->post("name");
				$data["description"] = $this->input->post("description");
				
				if($this->db->get_where("profile",array("name"=>$this->input->post("name")))->num_rows() > 0){
					$page_data["msg"] = get_phrase("failed");
				}else{
					$this->db->insert("profile",$data);
				}
				
				$page_data['profiles'] = $this->db->get("profile")->result_object();
				echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
				exit;
			}
	
			if($param1==="profile_edit"){
				$data["name"] = $this->input->post("name");
				$data["description"] = $this->input->post("description");

				
				if($this->db->get_where("profile",array("name"=>$this->input->post("name")))->num_rows() > 1){
					$page_data["msg"] = get_phrase("failed");
				}else{
					$this->db->where(array("profile_id"=>$param2));
					$this->db->update("profile",$data);
				}
				
				$page_data['profiles'] = $this->db->get("profile")->result_object();
				echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
				exit;
			}
	
			if($param1==="profile_delete"){
				$this->db->where(array("profile_id"=>$param2));
				$this->db->delete("profile");
				
				$page_data['profiles'] = $this->db->get("profile")->result_object();
				echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
				exit;
			}
			
			if($param1==="assign_privileges"){
				$privileges = $this->input->post("privilege_id");
				
				if($this->db->get_where("access",array("profile_id"=>$param2))->num_rows()>0){
					$this->db->where(array("profile_id"=>$param2));
					$this->db->delete("access");
				}
				
				
				foreach($privileges as $privilege):
					$data['entitlement_id'] = $privilege;
					$data['profile_id'] = $param2;
					
					$this->db->insert("access",$data);
				endforeach;
				
				$page_data['profiles'] = $this->db->get("profile")->result_object();
				echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
				exit;
			}
			
			
			$page_data['profiles'] = $this->db->get("profile")->result_object();
			$page_data['page_name']  = __FUNCTION__;
	        $page_data['view_type']  = get_called_class();
	        $page_data['page_title'] = get_phrase(__FUNCTION__);
			$this->load->view('backend/index', $page_data);
	}
	
	public function roles($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url() . 'login', 'refresh');
		
		$page_data['msg'] = get_phrase("success");
		
		
		if($param1==="role_add"){
			$data["name"] = $this->input->post("name");
			$data["contribution"] = $this->input->post("contribution");
			$data["department_id"] = $this->input->post("department_id");
			
			if($this->db->get_where("role",array("name"=>$this->input->post("name"),"role_id"=>$this->input->post("role_id")))->num_rows() > 0){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->insert("role",$data);
			}
			
			$page_data['roles'] = $this->db->get("role")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="role_edit"){
			$data["name"] = $this->input->post("name");
			$data["contribution"] = $this->input->post("contribution");
			$data["department_id"] = $this->input->post("department_id");
			
			if($this->db->get_where("role",array("name"=>$this->input->post("name"),"role_id"=>$this->input->post("role_id")))->num_rows() > 1){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->where(array("role_id"=>$param2));
				$this->db->update("role",$data);
			}
			
			$page_data['roles'] = $this->db->get("role")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="role_delete"){
			$this->db->where(array("role_id"=>$param2));
			$this->db->delete("role");
			
			$page_data['roles'] = $this->db->get("role")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}
		
		
		$page_data['roles'] = $this->db->get("role")->result_object();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['view_type']  = get_called_class();
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$this->load->view('backend/index', $page_data);
	}

	public function teams($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url() . 'login', 'refresh');
		
				$page_data['msg'] = get_phrase("success");
		
		
		if($param1==="team_add"){
			$data["name"] = $this->input->post("name");
			$data["country_id"] = $this->input->post("country_id");
			$data["description"] = $this->input->post("description");
			
			if($this->db->get_where("team",array("name"=>$this->input->post("name"),"country_id"=>$this->input->post("country_id")))->num_rows() > 0){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->insert("team",$data);
			}
			
			$page_data['teams'] = $this->db->get("team")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="team_edit"){
			$data["name"] = $this->input->post("name");
			$data["country_id"] = $this->input->post("country_id");
			$data["description"] = $this->input->post("description");
			
			if($this->db->get_where("team",array("name"=>$this->input->post("name"),"country_id"=>$this->input->post("country_id")))->num_rows() > 1){
				$page_data["msg"] = get_phrase("failed");
			}else{
				$this->db->where(array("team_id"=>$param2));
				$this->db->update("team",$data);
			}
			
			$page_data['teams'] = $this->db->get("team")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}

		if($param1==="team_delete"){
			$this->db->where(array("team_id"=>$param2));
			$this->db->delete("team");
			
			$page_data['teams'] = $this->db->get("team")->result_object();
			echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
			exit;
		}
		
		
		$page_data['teams'] = $this->db->get("team")->result_object();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['view_type']  = get_called_class();
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$this->load->view('backend/index', $page_data);
	}


  	/** MANEGE USER INFORMATION **/
	public function manage_users($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		if($param1==='add_user'){
			$data['firstname'] = $this->input->post('firstname');
			$data['lastname'] = $this->input->post('lastname');
			$data['email'] = $this->input->post('email');
			$data['gender'] = $this->input->post('gender');
			$data['password'] = md5($this->input->post('password'));
			
			//Check if email exists
			$users_with_email = $this->db->get_where('users',array('email'=>$this->input->post('email')))->num_rows();
			
			if($users_with_email === 0){
				$this->db->insert('user',$data);
	
				$this->session->set_flashdata('flash_message',get_phrase('user_created_successfully'));
					
			}else{
				
				$this->session->set_flashdata('flash_message',get_phrase('process_failed_email_exists'));
			}
			
			redirect(base_url() . $this->session->login_type.'/manage_profile/', 'refresh');	
		}
		
		if($param1==='update'){
			
			$this->db->where(array('user_id'=>$param2));
			
			$data['firstname'] = $this->input->post('firstname');
			$data['lastname'] = $this->input->post('lastname');
			$data['email'] = $this->input->post('email');
			$data['gender'] = $this->input->post('gender');
			if($this->input->post('password')!==""){
				$data['password'] = md5($this->input->post('password'));
			}
			
			$this->db->update('user',$data);
			
			$this->session->set_flashdata('flash_message',get_phrase('profile_updated'));
			
			redirect(base_url() . $this->session->login_type.'/manage_profile/', 'refresh');	
		}
		
		if($param1==='delete'){
				
				//Check dependant records before delete
				
				$depandants_check = $this->dependants_records($param3);
				
				if($depandants_check === 0){
					$this->db->where(array('user_id'=>$param3));
				
					$this->db->delete('user');
					
					$this->session->set_flashdata('flash_message',get_phrase('user_deleted'));
				}else{
					$this->session->set_flashdata('flash_message',get_phrase('user_with_linkage_cannot_delete'));	
				}
				
				redirect(base_url() . $this->session->login_type.'/manage_profile/', 'refresh');
		}
		
		$page_data['user']  = $this->db->get_where("user",array('user_id'=>$this->session->login_user_id))->row();
		$page_data['users']  = $this->db->get_where("user")->row();
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase('manage_users');
        $this->load->view('backend/index', $page_data);
	}

	/** AJAX LOADED CONTENT END**/
}
