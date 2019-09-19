<?php

require_once('vendor/autoload.php');

class SingleSignOnService extends CI_Controller{

  public $auth;

      function __construct() {
          parent::__construct();
          $this->auth =  new \SimpleSAML\Auth\Simple('default-sp');
          $this->load->library('encryption');
      }

      function index(){
        $this->getAttributes();
      }

      function getAttributes(){

        if (!$this->auth->isAuthenticated()) {
            header('location:'.$this->config->item->idpEntity);
        }else{
          $attributes = $this->auth->getAttributes();

          $email = \Base32\Base32::encode($attributes['email'][0]);

          redirect(base_url().'login/getSSOService/'.urlencode($email),'refresh');
        }

      }
}
