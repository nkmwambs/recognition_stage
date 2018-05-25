<div class="sidebar-menu">
    <header class="logo-env" >

        <!-- logo -->
        <div class="logo" style="">
            <a href="<?php echo base_url(); ?>">
                <img src="<?php echo base_url();?>uploads/logo.png"  style="max-height:60px;"/>
            </a>
        </div>

        <!-- logo collapse icon -->
        <div class="sidebar-collapse" style="">
            <a href="#" class="sidebar-collapse-icon with-animation">

                <i class="entypo-menu"></i>
            </a>
        </div>

        <!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
        <div class="sidebar-mobile-menu visible-xs">
            <a href="#" class="with-animation">
                <i class="entypo-menu"></i>
            </a>
        </div>
    </header>

    <div style=""></div>	
    <ul id="main-menu" class="">
        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->


        <!-- DASHBOARD -->
        <li class="<?php if ($page_name == 'dashboard') echo 'active'; ?> ">
            <a href="<?php echo base_url();?>dashboard">
                <i class="entypo-gauge"></i>
                <span><?php echo get_phrase('dashboard'); ?></span>
            </a>
        </li>
        
        
        <!-- SURVEYS -->
        <li class="<?php
        if ($page_name == 'manage_surveys' ||
                $page_name == 'nominate')
                  echo 'opened active';
        ?> ">
            <a href="#">
                <i class="entypo-layout"></i>
                <span><?php echo get_phrase('surveys'); ?></span>
            </a>
            <ul>
            	
	            <li class="manage_surveys <?php if ($page_name == 'manage_surveys') echo 'active'; ?> ">
	               <a href="<?php echo base_url("surveys/manage_surveys"); ?>" class="ajax-content">
	                   <span><i class="entypo-tools"></i> <?php echo get_phrase('manage_surveys'); ?></span>
	                    </a>
	            </li>
                

	            <li class="<?php if ($page_name == 'nominate') echo 'active'; ?> ">
	                    <a href="<?php echo base_url("surveys/nominate"); ?>" class="ajax-content">
	                        <span><i class="entypo-compass"></i> <?php echo get_phrase('nominate'); ?></span>
	                    </a>
	            </li>
	            
	            <li class="survey_results <?php if ($page_name == 'survey_results') echo 'active'; ?> ">
	                    <a href="<?php echo base_url("surveys/survey_results"); ?>" class="ajax-content">
	                        <span><i class="entypo-doc-text"></i> <?php echo get_phrase('survey_results'); ?></span>
	                    </a>
	            </li>
                
            </ul>
        </li>
        
        
        <!-- MESSAGES -->
        <li class="<?php if ($page_name == 'messages') echo 'active'; ?> ">
            <a href="<?php echo base_url();?>messages/message">
                <i class="entypo-mail"></i>
                <span><?php echo get_phrase('messages'); ?></span>
            </a>
        </li>
        
        
        <!-- SETTINGS -->
        
        <li class="manage_settings <?php
        if ($page_name == 'system_settings' ||
                $page_name == 'manage_language' ||
                    $page_name == 'sms_settings')
                        echo 'opened active';
        ?> ">
            <a href="#">
                <i class="entypo-lifebuoy"></i>
                <span><?php echo get_phrase('settings'); ?></span>
            </a>
            <ul>

	                <li class="system_settings <?php if ($page_name == 'system_settings') echo 'active'; ?> ">
	                    <a href="<?php echo base_url("settings/system_settings"); ?>" class="ajax-content">
	                        <span><i class="entypo-cog"></i> <?php echo get_phrase('general_settings'); ?></span>
	                    </a>
	                </li>

                
	                <li class="sms_settings <?php if ($page_name == 'sms_settings') echo 'active'; ?> ">
	                    <a href="<?php echo base_url("settings/sms_settings"); ?>" class="ajax-content">
	                        <span><i class="entypo-mobile"></i> <?php echo get_phrase('sms_settings'); ?></span>
	                    </a>
	                </li>

	                <li class="manage_language <?php if ($page_name == 'manage_language') echo 'active'; ?> ">
	                    <a href="<?php echo base_url("settings/manage_language"); ?>" class="ajax-content">
	                        <span><i class="entypo-language"></i> <?php echo get_phrase('language_settings'); ?></span>
	                    </a>
	                </li>

            </ul>
        </li>



		<!-- SETTINGS -->
        <li class="manage_accounts <?php
        if ($page_name == 'countries' || 
            $page_name == 'roles'|| 
            $page_name == 'departments' ||
            $page_name == 'teams' ||
			$page_name == 'profiles' ||
			$page_name == 'manage_users')
			
            echo 'opened active';
        ?> ">
            <a href="#">
                <i class="entypo-lock"></i>
                <span><?php echo get_phrase('account'); ?></span>
            </a>
            <ul>
                               
                <!--ACCOUNT SET UP PARAMETERS-->
                <li class="manage_setup_parameters <?php 
                		if ($page_name == 'countries' || 
                			$page_name == 'roles'|| 
                			$page_name == 'departments' ||
                			$page_name == 'teams' ||
							$page_name == 'profiles') 
                			
                			echo 'opened active'; ?> ">
                    <a href="#">
                        <span><i class="entypo-loop"></i> <?php echo get_phrase('setup'); ?></span>
                    </a>
                    <ul>
                        <li class="setup_countries <?php if ($page_name == 'countries') echo 'active'; ?>">
                        	<a href="<?php echo base_url(); ?>account/countries" class="">
                                <span><i class="entypo-globe"></i><?php echo get_phrase('countries'); ?></span>
                            </a>
                        </li>
                                              
                        <li class="setup_departments <?php if ($page_name == 'departments') echo 'active'; ?>">
                        	<a href="<?php echo base_url(); ?>account/departments"  class="">
                                    <span><i class="entypo-progress-3"></i><?php echo get_phrase('departments'); ?></span>
                            </a>
                        </li>
                        
                        <li class="setup_teams <?php if ($page_name == 'teams') echo 'active'; ?>">
                        	<a href="<?php echo base_url(); ?>account/teams"  class="">
                                    <span><i class="entypo-users"></i><?php echo get_phrase('teams'); ?></span>
                            </a>
                        </li>
                        
                         <li class="setup_roles <?php if ($page_name == 'roles') echo 'active'; ?>">
                        	<a href="<?php echo base_url(); ?>account/roles"  class="">
                                    <span><i class="entypo-bag"></i><?php echo get_phrase('roles'); ?></span>
                            </a>
                        </li>
                        
                        <li class="setup_profiles <?php if ($page_name == 'profiles') echo 'active'; ?>">
                        	<a href="<?php echo base_url(); ?>account/profiles"  class="">
                                    <span><i class="entypo-tag"></i><?php echo get_phrase('profiles'); ?></span>
                            </a>
                        </li>
                        
                    </ul>
                </li>
                
                
                <li class="manage_users <?php if ($page_name == 'manage_users') echo 'active'; ?> ">
                    <a href="<?php echo base_url("account/manage_users"); ?>">
                        <span><i class="entypo-users"></i> <?php echo get_phrase('manage_users'); ?></span>
                    </a>
                </li>
                         
            </ul>
        </li>
		
        

    </ul>

</div>