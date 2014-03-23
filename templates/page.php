
  <div class="content<?php if($page->sidebar) echo " sidebar"; ?>">
    <article>
      <?php //var_dump($page); ?>
      <header>
        <h1 class="entry-title"><?php echo $page->title; ?></h1>
      </header>
      <div class="page-content">
        <?php echo $page->content; ?>
      </div>
      <footer class="flex">
        <div class="grow6">
          <h3>Forfatter:</h3>
          <p><b>Jørgen Juel</b>
        </div>
        <div class="grow6">
          <h3>Metadata:</h3>
          <p>Publisert: </p>
          <?php $date = new DateTime($page->created); echo $date->format('Y-m-d');  ?>
          <?php echo "<pre>";
          //var_dump($date);
          $created = $page->created;
          var_dump($created);
          echo date_format($created, "Y-m-d H:i:s");
          echo "</pre>";?>
          <p>Sist endret: <?php echo $page->modified; ?></p>
        </div>
      </footer>
    </article>
    <?php if($page->sidebar){
        require_once("sidebar.php");
      } ?>
  </div>