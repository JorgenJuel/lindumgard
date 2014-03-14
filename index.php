<?php
require_once("inc/header.php");
?>
  <div class="content sidebar">
    <?php if(isset($_GET["q"])){$q = $_GET["q"];}else{$q = "";}?>
  	<article>
      <h2>Dette er en artikkel</h2>
      <h2>Dette er en artikkel</h2>
      <h2>Dette er en artikkel</h2>
      <h2>Dette er en artikkel</h2>
      <?php echo $q; ?>
  	</article>
    <aside>
      <h1>Dette er ved siden av</h1>
    </aside>
  </div>
<?php
require_once("inc/footer.php");
?> 