<?php 
	require_once("config.php"); 
	require_once("connect.php");
	require_once("functions.php");
	global $conn;
	$page = new Page($conn);
?>
<!doctype html>
<html>
<head>
	<title><?php echo $page->title; ?></title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="/assets/css/style.css">
	<meta name="viewport" content="width=device-width, user-scalable=no">
  <?php if(! empty($page->excerpt)): ?>
    <meta type="description" content="<?php echo $page->excerpt; ?>">
  <?php endif; ?>
</head>
<body>
	<header id="main-header">
		<div class="logo">
			<h1><a href="/">Lindumgard.no</a></h1>
		</div>
		<?php require_once("menu.php"); ?>
	</header>
	<section class="main">
		