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

class Surveys extends CI_Controller
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
            redirect(base_url(), 'refresh');
			
    }
    

	
	public function category_groups($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		
		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();
		
		/**Set theme to Flexigrid**/
		$crud->set_theme('Flexigrid');//Flexigrid
		
		
		/** Grid Subject **/
		$crud->set_subject(get_phrase('category_grouping'));
		
		/**Select Category Table**/
		$crud->set_table('grouping');
		
		
		/** Set required fields **/
		$crud->required_fields(array("name","description","status"));
		
		/**Select Fields to Show in the Grid **/
		$crud->columns('name','description','status');
		
		/** Populate User Type **/
		$crud->field_type('status', 'dropdown',array('0'=>"inactive","1"=>"active"));
		
		
		/** Hide fields from add and edit forms**/
		$crud->add_fields(array('name','description','status'));
		$crud->edit_fields(array('name','description','status'));
		
		
		$output = $crud->render();	
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}
	
	public function categories($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');


		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();
		
		/**Set theme to Flexigrid**/
		$crud->set_theme('Flexigrid');//Flexigrid
		
		
		/** Grid Subject **/
		$crud->set_subject(get_phrase('category'));
		
		/**Select Category Table**/
		$crud->set_table('category');
		
		/** Set required fields **/
		$crud->required_fields(array("name","description","visibility","grouping_id","assignment","unit","status"));
		
		/** Related Tables to Category **/
		$crud->set_relation('visibility','country','name');
		$crud->set_relation('grouping_id','grouping','name');
		$crud->set_relation('assignment','contribution','name');
		$crud->set_relation('unit','unit','name');
		
		/** Populate Field Types **/
		$crud->field_type('status', 'dropdown',array('0'=>"inactive","1"=>"active"));	
		//$crud->field_type('unit', 'dropdown',array('0'=>get_phrase("country"),"1"=>get_phrase("department"),"2"=>get_phrase("team"),"3"=>get_phrase("user")));
		
		/**Select Fields to Show in the Grid **/
		$crud->columns('name','grouping_id','visibility','assignment',"unit",'status');
		
		/**Give columns user friendly labels**/
		$crud->display_as('name',get_phrase('title'))
				->display_as('grouping_id',get_phrase('category_group'))
				->display_as('visibility',get_phrase('country_visibility'))
				->display_as('assignment',get_phrase('assigned_user_type'))
				->display_as('status',get_phrase('status'));
		
		/**Callbacks**/
		$crud->callback_after_insert(array($this,'insert_audit_parameters'));
		$crud->callback_after_update(array($this,'update_audit_parameters'));
		
		/** Hide fields from add and edit forms**/
		$crud->fields('name','grouping_id','visibility','assignment','status','created_by','created_date','last_modified_by');
		$crud->add_fields('name','description','grouping_id','visibility','assignment','unit','status');
		$crud->edit_fields('name','description','grouping_id','visibility','assignment','unit','status');
		
		/** Assign Privileges **/
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_category")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_category")) $crud->unset_edit();	
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_category")) $crud->unset_delete();
				
		//$crud->add_action('More', '', 'demo/action_more','ui-icon-plus');
		
		$output = $crud->render();	
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

	public function insert_audit_parameters($post_array,$primary_key){
		$post_array['created_by'] = $this->session->login_user_id;
		$post_array['created_date'] = date('Y-m-d h:i:s');
		$post_array['last_modified_by'] = $this->session->login_user_id;
		
		$this->db->where(array("category_id"=>$primary_key));
		$this->db->update("category",$post_array);
		
		return true;
	}
	
	public function update_audit_parameters($post_array,$primary_key){
			
		$data['last_modified_by'] = $this->session->login_user_id;
		
		$this->db->update('category',$data,array('category_id' =>$primary_key));
		
		return true;
	}
		
	public function survey_setting(){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();
		
		/**Set theme to Flexigrid**/
		$crud->set_theme('datatables');//Flexigrid
		
		
		/** Grid Subject **/
		$crud->set_subject(get_phrase('survey'));
		
		/**Select Category Table**/
		$crud->set_table('survey');
		
				
		/** Related Tables to Category **/
		$crud->set_relation('country_id','country','name');
		$crud->set_relation('created_by','user','firstname');
		$crud->set_relation('last_modified_by','user','firstname');

		
		/** Populate Status Type **/
		$crud->field_type('status', 'dropdown',array('0'=>"inactive","1"=>"active"));	
		
		/**Select Fields to Show in the Grid **/
		$crud->columns(array('start_date','end_date','country_id','status'));
		
		/** Show add/edit fields**/
		$crud->fields(array('start_date','end_date','status'));
		
		
		/** Set required fields **/
		$crud->required_fields(array('start_date','end_date','country_id','status'));
		
		/** Set Field Label **/
		$crud->display_as("country_id",get_phrase("country"));
		
		/**Callbacks**/
		$crud->callback_after_insert(array($this,'insert_survey_audit_parameters'));
		$crud->callback_after_update(array($this,'update_survey_audit_parameters'));
		$crud->callback_insert(array($this,'check_survey_existence'));
		
		/** Assign Privileges **/
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_survey")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_survey")) $crud->unset_edit();	
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_survey")) $crud->unset_delete();
		if($this->crud_model->check_profile_privilege($this->session->profile_id,"survey_results")) $crud->add_action(get_phrase('results'), '', '', 'ui-icon-plus',array($this,'show_nomination_results'));
		
		
		$output = $crud->render();	
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

	function show_nomination_results($primary_key , $row){
		return base_url().'surveys/survey_results/'.$primary_key;
	}
	
	function check_survey_existence($post_array){
		$active_all_countries_survey = $this->db->get_where("survey",array("country_id"=>"0","status"=>"1"))->num_rows();
		$active_country_survey = $this->db->get_where("survey",array("country_id"=>$post_array['country_id'],"status"=>"1"))->num_rows();
		
		if($active_all_countries_survey == 0 && $active_country_survey == 0){
			return $this->db->insert("survey",$post_array);
		}
		return $post_array;
	}

	function insert_survey_audit_parameters($post_array,$primary_key){
		$post_array['created_by'] = $this->session->login_user_id;
		$post_array['created_date'] = date('Y-m-d h:i:s');
		$post_array['last_modified_by'] = $this->session->login_user_id;
		
		$this->db->where(array("survey_id"=>$primary_key));
		$this->db->update("survey",$post_array);
		
		return true;
	}

	public function update_survey_audit_parameters($post_array,$primary_key){
			
		$data['last_modified_by'] = $this->session->login_user_id;
		
		$this->db->update('survey',$data,array('survey_id' =>$primary_key));
		
		return true;
	}

	public function mail_templates(){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
        $this->load->view('backend/index', $page_data);
	}
	
	public function nominate($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		
		$msg = get_phrase("success");
		
		if($param1=="start_nomination"){
			$survey = $this->db->get_where("survey",array("status"=>"1"));
			
			$result = $this->db->get_where("result",array("survey_id"=>$survey->row()->survey_id,"user_id"=>$param2));
			
			
			if($result->num_rows() === 0){
				$data['survey_id'] = $survey->row()->survey_id;
				$data['user_id'] = $param2;
				$data['status'] = "0";	
				$data['created_date'] = date("Y-m-d h:i:s");	
				$data['created_by'] = $param2;	
				$data['last_modified_by'] = $param2;	
				$this->db->insert("result",$data);
			}else{
				$msg = get_phrase("failed");	
			}
			
			$this->session->set_flashdata('flash_message',$msg);
			
			redirect(base_url().get_called_class().'/'.__FUNCTION__,"refresh");
		}
		
		if($param1=="submit_vote"){
			
			$result = $this->db->get_where("result",array("status"=>"0","user_id"=>$param2));
			
			if($result->num_rows() > 0){
				$this->db->where(array("result_id"=>$result->row()->result_id));
				$data['status'] = "1";
				$this->db->update("result",$data);
				
			}else{$msg = get_phrase("failed");}
			
			$this->session->set_flashdata('flash_message',$msg);
			
			redirect(base_url().get_called_class().'/'.__FUNCTION__,"refresh");
		}
		
		$user = $this->db->get_where("user",array("user_id"=>$this->session->login_user_id))->row();
		$role = $this->db->get_where("role",array("role_id"=>$user->role_id))->row();
		$contribution = $role->contribution;
		
		$groupings =  $this->db->get_where("grouping",array("status"=>'1'))->result_object();
		
		$grouped_categories = array();

		$user_scope = $this->crud_model->scope_countries($this->session->login_user_id,true);
 				
		foreach($groupings as $grouping){
			$categories = $this->crud_model->categories_in_grouping($grouping->grouping_id,$this->session->login_user_id,$contribution);
			
			if(sizeof($categories) > 0){
				foreach($categories as $category){
					$grouped_categories[$grouping->grouping_id][] = $category;
				}
			}
		}

		$page_data['results']  = array();
		if($this->db->get_where("result",array("user_id"=>$this->session->login_user_id,"status"=>'0'))->num_rows() > 0){
			$current_survey = $this->db->get_where("result",array("user_id"=>$this->session->login_user_id,"status"=>'0'))->row();
			$page_data['results'] = $this->db->get_where("tabulate",array("result_id"=>$current_survey->result_id))->result_object();
		}		
		
		$page_data['groupings'] =(OBJECT) $grouped_categories;
		$page_data['user'] = $user;
		$page_data['role'] = $role;
		$page_data['contribution'] = $contribution;
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
        $this->load->view('backend/index', $page_data);
	}

	function post_nomination_choice($category_id="",$nominee_id="",$voting_user_id=""){
		//echo $category_id;
		$result = $this->db->get_where("result",array("user_id"=>$voting_user_id,"status"=>0))->row();
		$category = $this->db->get_where("category",array("category_id"=>$category_id))->row();
		
		$data['result_id'] = $result->result_id;
		$data['category_id'] = $category_id;
		$data['nominated_unit'] = $category->unit;
		$data['nominee_id'] = $nominee_id;
		$data['created_by'] = $voting_user_id;
		$data['created_date'] = date("Y-m-d h:i:s");
		$data['last_modified_by'] = $voting_user_id;

		if($this->db->get_where("tabulate",array("result_id"=>$result->result_id,"category_id"=>$category_id))->num_rows() === 0){
			$this->db->insert("tabulate",$data);
			
		}else{
			$this->db->where(array("result_id"=>$result->result_id,"category_id"=>$category_id));
			$this->db->update("tabulate",$data);
		}
	}
	
	public function survey_results($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');
		
		if($param1=="") redirect(base_url().'surveys/survey_setting', 'refresh');
		$survey = array();
		$survey_arr = $this->db->get_where("survey",array("survey_id"=>$param1));
		$results = array();
		if($survey_arr->num_rows() > 0){
			$survey = $survey_arr->row();
			$this->db->join("tabulate","tabulate.result_id=result.result_id");
			$results = $this->db->get_where("result",array("survey_id"=>$survey->survey_id))->result_object();
		}
		
		$page_data['results']  =  $results;
		$page_data['survey']  =  $survey;
		$page_data['view_type']  = get_called_class();
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
        $this->load->view('backend/index', $page_data);
	}
	
	
}
