<?php

require_once('vendor/autoload.php');

$as = new \SimpleSAML\Auth\Simple('default-sp');

if (!$as->isAuthenticated()) {
    /* Show login link. */
    //print('<a href="/login">Login</a>');
    header('location:https://dev-585368.okta.com');
}else{
  $attributes = $as->getAttributes();
}
?>
<html>
  <head>
    <title>Redirect</title>
  </head>
  <body>
    <form action="http://localhost/recognition/login/SingleSignOnService" name="myform" method="post">
        <input type="hidden" name="email" value="<?php echo $attributes['email'][0];?>" />
    </form>
    <script type="text/javascript">
      document.forms.myform.submit();
    </script>
  </body>
</html>
