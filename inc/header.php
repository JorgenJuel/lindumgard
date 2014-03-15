<?php 
	require_once("config.php"); 
	require_once("connect.php");
	require_once("functions.php");
	$page = get_page();
?>
<!doctype html>
<html>
<head>
	<title><?php echo $page->title; ?></title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
	<header class="main-header">
		<div class="logo">
			<h1><a href="/">Lindumgard.no</a></h1>
		</div>
		<?php require_once("menu.php"); ?>
	</header>
	<section class="main">
		