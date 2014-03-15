
  <div class="content<?php if($page->sidebar) echo " sidebar"; ?>">
    <article>
      <h1 class="entry-title"><?php echo $page->title; ?></h1>
      <?php echo $page->content; ?>
    </article>
    <?php if($page->sidebar){
        require_once("sidebar.php");
      } ?>
  </div>