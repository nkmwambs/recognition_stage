<link rel="stylesheet" href="<?=base_url();?>assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" href="<?=base_url();?>assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="<?=base_url();?>assets/css/bootstrap.css">
<link rel="stylesheet" href="<?=base_url();?>assets/css/neon-core.css">
<link rel="stylesheet" href="<?=base_url();?>assets/css/neon-theme.css">
<link rel="stylesheet" href="<?=base_url();?>assets/css/neon-forms.css">


<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.2.0/min/dropzone.min.js"></script>

<link rel="stylesheet" href="<?=base_url();?>assets/css/custom.css">

	<!--Font Awesome-->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<?php
    $skin_colour = $this->db->get_where('settings' , array(
        'type' => 'skin_colour'
    ))->row()->description; 
    if ($skin_colour != ''):?>

    <link rel="stylesheet" href="<?=base_url();?>assets/css/skins/<?php echo $skin_colour;?>.css">

<?php endif;?>

<?php if ($text_align == 'right-to-left') : ?>
    <link rel="stylesheet" href="<?=base_url();?>assets/css/neon-rtl.css">
<?php endif; ?>


        <!--[if lt IE 9]><script src="<?=base_url();?>assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link rel="shortcut icon" href="<?=base_url();?>assets/images/favicon.png">
<link rel="stylesheet" href="<?=base_url();?>assets/css/font-icons/font-awesome/css/font-awesome.min.css">

<link rel="stylesheet" href="<?=base_url();?>assets/js/vertical-timeline/css/component.css">
<link rel="stylesheet" href="<?=base_url();?>assets/js/datatables/responsive/css/datatables.responsive.css">



  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
    function checkDelete()
    {
        var chk=confirm("Are You Sure To Delete This !");
        if(chk)
        {
          return true;  
        }
        else{
            return false;
        }
    }
</script>