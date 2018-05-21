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

class Messages extends CI_Controller
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
			
        $page_data['page_name']  = "message";
        $page_data['view_type']  = get_called_class();
        $page_data['page_title'] = get_phrase('messages');
        $this->load->view('backend/index', $page_data);
    }
    
	
}
