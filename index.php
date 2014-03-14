<?php
require_once("inc/header.php");
?>
  <div class="content<?php if($page->sidebar) echo " sidebar"; ?>">
  	<article>
      <h1 class="entry-title"><?php echo $page->title; ?></h1>
      <?php echo $page->content; ?>
  	</article>
    <?php if($page->sidebar): ?>
    <aside>
      <h1>Dette er ved siden av</h1>
    </aside>
    <?php endif; ?>
  </div>
<?php
require_once("inc/footer.php");
?> 