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
    
	/** AJAX LOADED CONTENT START**/
	
	public function manage_surveys(){
		$page_data = array();
		echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
	}
	
	public function nominate(){
		$page_data = array();
		echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
	}
	
	public function survey_results(){
		$page_data = array();
		echo $this->load->view('backend/'.get_called_class()."/".__FUNCTION__, $page_data,true);
	}
	
	/** AJAX LOADED CONTENT END**/
}
