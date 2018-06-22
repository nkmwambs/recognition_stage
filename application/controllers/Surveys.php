<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*
 *	@author 	: Nicodemus Karisa
 *	date		: 6th June, 2018
 *	AFR Staff Recognition system
 *	https://www.compassion.com
 *	NKarisa@ke.ci.org
 */

class Surveys extends CI_Controller
{


	function __construct()
	{
		parent::__construct();
		$this->load->database();
        $this->load->library('session');

		/** System Feature Session Tag **/
		$this->session->set_userdata('view_type', "surveys");

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

		/**Set theme to flexigrid**/
		$crud->set_theme('flexigrid');//flexigrid


		/** Grid Subject **/
		$crud->set_subject(get_phrase('category_grouping'));

		/**Select Category Table**/
		$crud->set_table('grouping');

		/** Related Tables to Category **/
		$crud->set_relation('created_by','user','firstname');
		$crud->set_relation('last_modified_by','user','firstname');

		/** Set required fields **/
		$crud->required_fields(array("name","description","status"));

		/**Select Fields to Show in the Grid **/
		$crud->columns('name','description','categories','status');

		/** Populate User Type **/
		$crud->field_type('status', 'dropdown',array('0'=>"inactive","1"=>"active"));

		/** Assign Privileges **/
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_grouping")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_grouping")) $crud->unset_edit();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_grouping")) $crud->unset_delete();


		/** Callbacks**/
		$crud->callback_column('categories',array($this,'count_of_categories_grouping'));
		$crud->callback_delete(array($this,"grouping_check_on_delete"));


		/** Hide fields from add and edit forms**/
		$crud->add_fields(array('name','description','status'));
		$crud->edit_fields(array('name','description','status'));


		$output = $crud->render();
		$page_data['view_type']  = "surveys";
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

	function grouping_check_on_delete($primary_key){
		/**Check if grouping it has categories**/
		$count_of_categories = $this->db->get_where("category",array("grouping_id"=>$primary_key));

		if($count_of_categories->num_rows() === 0){
			$this->db->where(array("grouping_id"=>$primary_key));
			return $this->db->delete("grouping");
		}else{
			return false;
		}
	}

	function count_of_categories_grouping($value,$row){
		return $this->db->get_where("category",array("grouping_id"=>$row->grouping_id))->num_rows();
	}

	public function categories($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');


		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();

		/**Set theme to flexigrid**/
		$crud->set_theme('flexigrid');//flexigrid


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
		$crud->columns('name','grouping_id','visibility','assignment',"unit",'has_votes','status');

		/**Give columns user friendly labels**/
		$crud->display_as('name',get_phrase('title'))
				->display_as('grouping_id',get_phrase('category_group'))
				->display_as('visibility',get_phrase('country_visibility'))
				->display_as('assignment',get_phrase('assigned_user_type'))
				->display_as('status',get_phrase('status'));


		/** Assign Privileges **/
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_category")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_category")) $crud->unset_edit();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_category")) $crud->unset_delete();

    /**Unset Text Editor**/
    $crud->unset_texteditor(array('description','full_text'));

		/**Callbacks**/
		$crud->callback_after_insert(array($this,'insert_audit_parameters'));
		$crud->callback_after_update(array($this,'update_audit_parameters'));
		$crud->callback_column("has_votes",function ($value,$row){
        	return $this->db->get_where("tabulate",array("category_id"=>$row->category_id))->num_rows() > 0?get_phrase("yes"):get_phrase("no");
    	});
    $crud->callback_delete(array($this,"count_votes_on_category_delete"));



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
		$page_data['view_type']  = "surveys";
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

  function count_votes_on_category_delete($primary_key){
    /** Check if has votes **/
    $has_votes = $this->db->get_where("tabulate",array("category_id"=>$primary_key));

    if($has_votes->num_rows() === 0){
      $this->db->where(array("category_id"=>$primary_key));
      return $this->db->delete("category");
    }else{
      return false;
    }
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

  /**
    *Survey settings allows an authorized user to add/edit or delete a insert_survey_audit_parameters
    * The following are the controls in this Feature
    * a) No more than one active survey is allowed at any given time
    * b) A survey cannot be deleted or editted once users start voting
    * c) A survey cannot be mannually closed if it has unsubmitted vote.
    * d) Unsubmitted votes at closure can be forced to be deleted or submmitted depending on the survey setting
    *
  **/

	public function survey_setting(){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');

		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();

		/**Set theme to flexigrid**/
		$crud->set_theme('datatables');//flexigrid


		/** Grid Subject **/
		$crud->set_subject(get_phrase('survey'));

		/**Select Category Table**/
		$crud->set_table('survey');


		/** Related Tables to Category **/
		$crud->set_relation('country_id','country','name');
		$crud->set_relation('created_by','user','firstname');
		$crud->set_relation('last_modified_by','user','firstname');

		/** Populate Status/Allow User Edit Type **/
		$crud->field_type('status', 'dropdown',array('0'=>"inactive","1"=>"active"));
    	$crud->field_type('allow_user_edit', 'dropdown',array('0'=>"no","1"=>"yes"));
		$crud->field_type('unsubmitted_votes_action', 'dropdown',array('0'=>get_phrase('no_action'),"1"=>get_phrase('force_delete'),"2"=>get_phrase("force_submit")));

		/**Select Fields to Show in the Grid **/
		$crud->columns(array('start_date','end_date','country_id',"allow_user_edit","unsubmitted_votes_action",'votes','status'));

		/** Show add/edit fields**/
		$crud->fields(array('start_date','end_date','allow_user_edit','unsubmitted_votes_action','status'));


		/** Set required fields **/
		$crud->required_fields(array('start_date','end_date','country_id','allow_user_edit','unsubmitted_votes_action','status'));

		/** Set Field Label **/
		$crud->display_as("country_id",get_phrase("country"));

		/**Callbacks**/
		$crud->callback_after_insert(array($this,'insert_survey_audit_parameters'));
		$crud->callback_after_update(array($this,'update_survey_audit_parameters'));
		$crud->callback_insert(array($this,'survey_check_on_insert'));
		$crud->callback_update(array($this,"survey_check_on_update"));
    	$crud->callback_delete(array($this,"survey_check_on_delete"));
    	$crud->callback_column('votes',array($this,'count_of_votes_survey'));

		/** Assign Privileges **/
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"survey_status")) $crud->add_action(get_phrase('change_status'), '', '', 'ui-icon-shuffle',array($this,'change_survey_status'));
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_survey")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_survey")) $crud->unset_edit();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_survey")) $crud->unset_delete();
		if($this->crud_model->check_profile_privilege($this->session->profile_id,"survey_results")) $crud->add_action(get_phrase('results'), '', '', 'ui-icon-folder-open',array($this,'show_nomination_results'));

		/**Remove the view button**/
		$crud->unset_read();
		

		$output = $crud->render();
		$page_data['view_type']  = "surveys";
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

  function change_survey_status($primary_key , $row){
  	/** The Survey Object**/
	$survey = $this->db->get_where("survey",array("survey_id"=>$primary_key))->row();
	
	/** Count of Unsubmitted Votes in the Survey **/
	$unsubmitted_votes = $this->db->get_where("result",array("survey_id"=>$primary_key,"status"=>0))->num_rows();
		
	/** Unsubmitted Votes Action on Deactivate **/
	$action = $survey->unsubmitted_votes_action;
	
	if($survey->status === '1' && $unsubmitted_votes > 0){
					
		if($action === 0) {
			//Do nothing
		}elseif($action === '1'){
			//Force Delete
			//$unsubmitted_votes = $this->db->get_where("result",array("survey_id"=>$primary_key,"status"=>'0'))->result_object();
			foreach($unsubmitted_votes as $to_delete){
				//Delete votes tabulation
				$this->db->where(array("result_id"=>$to_delete->result_id));
				$this->db->delete("tabulate");
				
				//Delete the Vote Result
				$this->db->where(array("result_id"=>$to_delete->result_id));
				$this->db->delete("result");
			}
			
		}elseif($action === '2'){
			//Force Submit
			$this->db->where(array('status'=>0));
			$data['status'] = '1';
			$data['forced_submit'] = '1';
			
			$this->db->update('result',$data);
		}
		
		$this->db->where(array("survey_id"=>$primary_key));
		$data2['status'] = '0';
		
		$this->db->update('survey',$data2);
		
	}elseif($survey->status === '1' && $unsubmitted_votes === '0'){
		//Close the survey
		$data3['status'] = 0;
		$this->db->where(array('survey_id'=>$primary_key));
		
		$this->db->update("survey",$data3);
			
	}elseif($survey->status === 0){
		//Check if active survey exists
		$active_surveys = $this->db->get_where("survey",array("status"=>1))->num_rows();
		if($active_surveys === '0'){
			//Activate the Survey
			$data5['status'] = '1';
			$this->db->where(array('survey_id'=>$primary_key));
			$this->db->update("survey",$data5);
		}
	}
	
  
  }

  function count_of_votes_survey($value,$row){
    	return $this->db->get_where("result",array("survey_id"=>$row->survey_id))->num_rows();
  }

  function survey_check_on_delete($primary_key){
    /** Count of Votes for the survey to be deleted **/
    $count_of_votes = $this->db->get_where("result",array("survey_id"=>$primary_key))->num_rows();

    /** Delete if no vote cast **/
    if($count_of_votes === 0){
      return $this->db->delete("survey",array("survey_id"=>$primary_key));
    }else{
      return false;
    }

  }

	function survey_check_on_update($post_array,$primary_key){
    /** Convert Uk-based dates to MySQL Date format **/
    $post_array['start_date'] = date("Y-m-d",strtotime($post_array['start_date']));
    $post_array['end_date'] = date("Y-m-d",strtotime($post_array['end_date']));

    /** Check if an active survey exists  **/
    $check_active_survey = $this->db->get_where("survey",array("status"=>"1"))->num_rows();

    /** Count of Votes for the survey to be deleted **/
    $count_of_votes = $this->db->get_where("result",array("survey_id"=>$primary_key))->num_rows();

    /** Check status of current of the updated survey **/
    $previous_survey_status = $this->db->get_where("survey",array("survey_id"=>$primary_key))->row()->status;

    if($check_active_survey > 0 && $previous_survey_status === "0" && $post_array['status'] = "1" && $count_of_votes > 0){
      return false;
    } else{
      /** Update record if not more than one active survey will be active **/
      $this->db->where(array("survey_id"=>$primary_key));
      return $this->db->update("survey",$post_array);
    }

	}


	function show_nomination_results($primary_key , $row){
		return base_url().'surveys/survey_results/'.$primary_key;
	}

	function survey_check_on_insert($post_array){
		$all_active_surveys = $this->db->get_where("survey",array("status"=>"1"))->num_rows();

		if($all_active_surveys == 0){
      $post_array['start_date'] = date("Y-m-d",strtotime($post_array['start_date']));
      $post_array['end_date'] = date("Y-m-d",strtotime($post_array['end_date']));
			return $this->db->insert("survey",$post_array);
		}else{
      return false;
    }

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

/*
*End of Survey settings feature
*/

	public function votes($param1="",$param2="",$param3=""){
		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');

		if ($this->session->userdata('user_login') != 1)
            redirect(base_url(), 'refresh');

		/**Instatiate CRUD**/
		$crud = new grocery_CRUD();

		/**Set theme to flexigrid**/
		$crud->set_theme('flexigrid');//flexigrid


		/** Grid Subject **/
		$crud->set_subject(get_phrase('votes'));

		/**Select Category Table**/
		$crud->set_table('result');

    /** Callbacks**/
    $crud->callback_before_delete(array($this,'delete_result_tabulation'));

		/** Populate Status Type **/
		$crud->field_type('status', 'dropdown',array('0'=>"active","1"=>"submitted"));

		/** User Freindly Label**/
		$crud->display_as("user_id",get_phrase("voter_last_name"));

		/** Related Tables to Category **/
		//$crud->set_relation('survey_id','survey','start_date');
		$crud->set_relation('user_id','user','{firstname} {lastname}');
		$crud->set_relation('created_by','user','{firstname} {lastname}');
		$crud->set_relation('last_modified_by','user','{firstname} {lastname}');
		//$crud->set_relation('survey_id','survey','survey_id',array("status"=>1));


		/** SET WHERE **/
		$survey_id = 0;
		$survey = $this->db->get_where("survey",array("status"=>"1"));
		if($survey->num_rows() > 0){
			$survey_id = $survey->row()->survey_id;
		}
		$crud->where('survey_id',$survey_id);

		/** Assign Privileges **/
		//if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"add_vote")) $crud->unset_add();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"edit_vote")) $crud->unset_edit();
		if(!$this->crud_model->check_profile_privilege($this->session->profile_id,"delete_vote")) $crud->unset_delete();
		$crud->unset_add();
		/** Show in Edit or Add form**/
		//$crud->columns('survey_id','user_id','status');
		$crud->add_fields('survey_id','user_id','status');
		$crud->edit_fields('status');


		$output = $crud->render();
		$page_data['view_type']  = "surveys";
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
		$output = array_merge($page_data,(array)$output);
        $this->load->view('backend/index', $output);
	}

  function delete_result_tabulation($primary_key){
    /** Count Tabulated results **/
    $tabulated_results = $this->db->get_where("tabulate",array("result_id"=>$primary_key))->num_rows();

    if($tabulated_results > 0){
      $this->db->delete("tabulate",array("result_id"=>$primary_key));
    }

    return true;
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

			redirect(base_url()."surveys".'/'.__FUNCTION__,"refresh");
		}

		if($param1=="submit_vote"){

			$result = $this->db->get_where("result",array("status"=>"0","user_id"=>$param2));

			if($result->num_rows() > 0){
				$this->db->where(array("result_id"=>$result->row()->result_id));
				$data['status'] = "1";
				$this->db->update("result",$data);

			}else{$msg = get_phrase("failed");}

			$this->session->set_flashdata('flash_message',$msg);

			redirect(base_url()."surveys".'/'.__FUNCTION__,"refresh");
		}

    if($param1=="edit_nomination"){
      $data['status'] = "0";

      $this->db->where(array("survey_id"=>$param2,"user_id"=>$this->session->login_user_id));
      $this->db->update("result",$data);

      $this->session->set_flashdata('flash_message',get_phrase("success"));
      redirect(base_url()."surveys".'/'.__FUNCTION__,"refresh");

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
		$page_data['view_type']  = "surveys";
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

	function post_nomination_comment(){
		$comment = $_POST['comment'];
		$category_id = $_POST['category_id'];
		$user_id = $_POST['user_id'];

		$data['comment'] = $comment;

		$result = $this->db->get_where("result",array("user_id"=>$user_id,"status"=>0))->row();
		$category = $this->db->get_where("category",array("category_id"=>$category_id))->row();

		if($this->db->get_where("tabulate",array("result_id"=>$result->result_id,"category_id"=>$category_id))->num_rows() > 0){
			//$tabulate_id = $this->db->get_where("tabulate",array("result_id"=>$result->result_id,"category_id"=>$category_id))->row()->tabulate_id;
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
		$page_data['view_type']  = "surveys";
		$page_data['page_name']  = __FUNCTION__;
        $page_data['page_title'] = get_phrase(__FUNCTION__);
        $this->load->view('backend/index', $page_data);
	}


}
