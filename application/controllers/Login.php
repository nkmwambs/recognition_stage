<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/* 	
 * 	@author : Joyonto Roy
 * 	30th July, 2014
 * 	Creative Item
 * 	www.freephpsoftwares.com
 * 	http://codecanyon.net/user/joyontaroy
 */

class Login extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('crud_model');
        $this->load->database();
        $this->load->library('session');
        /* cache control */
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		//$this->db->cache_on();
		//$this->output->cache(60);
		$this->db->cache_delete_all();
    }

    //Default function, redirects to logged in user area
    public function index() {

        if ($this->session->userdata($this->session->login_type.'_login') == 1)  
        	redirect(base_url() . $this->session->login_type.'/dashboard', 'refresh');

        $this->load->view('backend/login');
    }

    //Ajax login function 
    function ajax_login() {
        $response = array();

        //Recieving post input of email, password from ajax request
        $email = $_POST["email"];
        $password = $_POST["password"];
        $response['submitted_data'] = $_POST;

        //Validating login
        $login_status = $this->validate_login($email, $password);
        $response['login_status'] = $login_status;
        if ($login_status == 'success') {
            $response['redirect_url'] = '';
        }

        //Replying ajax request with validation response
        echo json_encode($response);
    }

    //Validating login from ajax request
    function validate_login($email = '', $password = '') {
        $credential = array('email' => $email,"auth"=>1,"password"=>md5($password));


        // Checking login credential for admin
        $query = $this->db->get_where('user', $credential);
        if ($query->num_rows() > 0) {
			
		    $row = $query->row();
			$level = $this->db->get_where("level",array("level_id"=>$row->level_id))->row()->name;
			
		    $this->session->set_userdata($level.'_login', '1');
		    $this->session->set_userdata($level.'_id', $row->user_id);
		    $this->session->set_userdata('login_user_id', $row->user_id);
		    $this->session->set_userdata('name', $row->firstname);
		    $this->session->set_userdata('login_type', $level);
			$this->session->set_userdata('is_admin', $row->admin);
								
            return 'success';
        }

       

        return 'invalid';
    }

    /*     * *DEFAULT NOR FOUND PAGE**** */

    function four_zero_four() {
        $this->load->view('four_zero_four');
    }

    // PASSWORD RESET BY EMAIL
    function forgot_password()
    {
        $this->load->view('backend/forgot_password');
    }

    function ajax_forgot_password()
    {
        $resp                   = array();
        $resp['status']         = 'false';
        $email                  = $_POST["email"];
        //$reset_account_type     = '';
        //resetting user password here
        $new_password           =   substr( md5( rand(100000000,20000000000) ) , 0,7);

        // Checking credential for admin
        $query = $this->db->get_where('user' , array('email' => $email));
        if ($query->num_rows() > 0) 
        {
            //$reset_account_type     =   'admin';
            $this->db->where('email' , $email);
            $this->db->update('user' , array('password' => md5($new_password)));
            $resp['status']         = 'true';
        }
       

        // send new password to user email  
        $this->email_model->password_reset_email($new_password , $email);

        $resp['submitted_data'] = $_POST;

        echo json_encode($resp);
    }

    /*     * *****LOGOUT FUNCTION ****** */

    function logout() {
        $this->session->sess_destroy();
        $this->session->set_flashdata('logout_notification', 'logged_out');
        redirect(base_url(), 'refresh');
    }

}
