    <nav>
      <ul>
        <li <?php if($slug == "home") echo ' class="active"'; ?>><a href="/index.php">Hjem</a></li>
        <?php //printMenu(); ?>
    <?php foreach(get_menu() as $item):?>
      <li<?php if($item->slug == $page->slug) echo ' class="active"'; ?>>
        <a href="/<?php echo $item->slug; ?>"><?php echo $item->title ?></a>
      </li>
    <?php endforeach; ?>
      </ul>
    </nav>