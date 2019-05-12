	<?php
		//print_r($this->crud_model->list_potential_nominees_per_category('user',2));

		/** Active survey object **/
		$active_surveys = $this->db->get_where("survey",array("status"=>'1'));
		
		/** Number of active system users **/
		
		$active_users = $this->db->get_where("user",array("auth"=>"1"))->num_rows();
		
		/** Count of votes cast and votes not submitted for current active survey **/
		$vote_count = 0;
		$votes_not_submitted = 0;
		
		if($active_surveys->num_rows() > 0){
			$vote_count = $this->db->get_where("result",array("survey_id"=>$active_surveys->row()->survey_id,"status"=>1))->num_rows();
			$votes_not_submitted = $this->db->get_where("result",array("survey_id"=>$active_surveys->row()->survey_id,"status"=>0))->num_rows();
		}
		
		/** Number of days from now to the end of the current survey **/
		$days_remaining = 0;
		if($active_surveys->num_rows() > 0){
			$date1=date_create(date("Y-m-d"));
			$date2=date_create($active_surveys->row()->end_date);
			$diff=date_diff($date1,$date2);
			$days_remaining = $diff->format("%a");
		}
	?>
	<hr />
		<div class="row">
			<div class="col-sm-3 active_survey">
			
				<div class="tile-stats tile-primary">
					<div class="icon"><i class="entypo-suitcase"></i></div>
					<div class="num" data-start="0" data-end="<?=$active_surveys->num_rows();?>"  data-duration="1500" data-delay="0">0</div>
					
					<h3><?=get_phrase("active_survey")?></h3>
					<p><?=get_phrase("so_far_in_our_application")?>.</p>
				</div>
				
			</div>
			
			<div class="col-sm-3 registered_users">
			
				<div class="tile-stats tile-red">
					<div class="icon"><i class="entypo-gauge"></i></div>
					<div class="num"><?=$active_users;?></div>
					
					<h3><?=get_phrase("active_users");?></h3>
					<p><?=get_phrase("so_far_in_our_application")?>.</p>
				</div>
				
			</div>
			
			<div class="col-sm-3 cast_votes">
			
				<div class="tile-stats tile-aqua">
					<div class="icon"><i class="entypo-mail"></i></div>
					<div class="num"><?=$vote_count;?></div>
					
					<h3>Cast Votes</h3>
					<p><?=get_phrase("so_far_in_our_application")?>.</p>
				</div>
				
			</div>
			
			
			<div class="col-sm-3 uncast_votes">
			
				<div class="tile-stats tile-green">
					<div class="icon"><i class="entypo-paper-plane"></i></div>
					<div class="num"><?=$votes_not_submitted;?></div>
					
					<h3>Uncast Votes</h3>
					<p><?=get_phrase("so_far_in_our_application")?>.</p>
				</div>
				
			</div>
			
		</div>
		
		<div class="row">
			<div class="col-sm-3 voting_days">
			
				<div class="tile-stats tile-blue">
					<div class="icon"><i class="entypo-suitcase"></i></div>
					<div class="num"><?=$days_remaining;?></div>
					
					<h3>Days remaining</h3>
					<p><?=get_phrase("so_far_to_close_voting");?>.</p>
				</div>
				
			</div>
		</div>