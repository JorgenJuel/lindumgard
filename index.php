<?php
require_once("inc/header.php");
?>
<?php switch($page->slug){
  case "404": require_once("404.php"); break;
  case "home": require_once("home.php"); break;
  default: require_once("page.php");break;
}?>
<?php
require_once("inc/footer.php");
?> 