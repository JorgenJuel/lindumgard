
  <div class="content<?php if($page->sidebar) echo " sidebar"; ?>">
    <article>
      <?php //var_dump($page); ?>
      <header>
        <?php echo $page->getBreadcrumbs(); ?>
        <h1 class="entry-title"><?php echo $page->title; ?></h1>
      </header>
      <div class="page-content">
        <?php echo $page->content; ?>
      </div>
      <footer class="flex">
        <div class="grow6">
          <h3>Forfatter:</h3>
          <p><strong>Jørgen Juel</strong></p>
        </div>
        <div class="grow6">
          <br>
          <p>Publisert: <strong><?php echo $page->getDate("pub", "d/m/Y"); ?></strong></p>
          <p>Sist endret: <strong><?php echo $page->getDate("pub", "d/m/Y"); ?></strong></p>
        </div>
      </footer>
    </article>
    <?php if($page->sidebar){
        require_once("sidebar.php");
      } ?>
  </div>