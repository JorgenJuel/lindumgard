    <nav>
      <h2 class="mobile-title visible-scroll-mobile">Lindum Gard</h2>
      <a class="visible-mobile icon show_lines" id="mobile-menu">Open Menu</a>
      <ul id="main-menu">
        <li <?php if($page->slug == "home") echo ' class="active"'; ?>><a href="/index.php">Hjem</a></li>
        <?php //printMenu(); ?>
    <?php foreach($page->getMenu() as $item):?>
      <li<?php if($item->slug == $page->slug) echo ' class="active"'; ?>>
        <a href="/<?php echo $item->slug; ?>"><?php echo $item->title ?></a>
      </li>
    <?php endforeach; ?>
      </ul>
    </nav>