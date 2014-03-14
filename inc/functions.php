<?php
if(isset($_GET["q"])){
  $slug = $_GET["q"];
}else{
  $slug = "hjem";
}
function getPage(){
  global $slug;
  global $conn;
  try{
    $stmt = $conn->prepare('SELECT innhold.id, slug, title, content, excerpt, created, modified, sidebar, concat(fornavn, " ", etternavn) AS forfatter, epost FROM innhold LEFT OUTER JOIN forfatter ON author = forfatter.id WHERE slug = :slug;');  
    $stmt->execute(array('slug' => $slug));
    return $stmt->fetch(PDO::FETCH_OBJ);
  }catch(PDOException $e){
    echo 'ERROR: '. $e->getMessage();
  }
}

function getMenu(){
  global $slug;
  global $conn;
  try{
    $stmt = $conn->prepare('SELECT meny.id, meny.title, meny.item AS slug FROM meny; ');  
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_BOTH);
  }catch(PDOException $e){
    echo 'ERROR: '. $e->getMessage();
  }
}

function printMenu(){
  global $page;
  global $conn;
  try{
    $stmt = $conn->prepare('SELECT meny.id, meny.title, slug FROM meny INNER JOIN innhold ON meny.item = innhold.id; ');  
    $stmt->execute();
  }catch(PDOException $e){
    echo 'ERROR: '. $e->getMessage();
  }
  while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
    echo '<li';
    if($page->slug == $row["slug"])
      echo ' class="active"';
    echo '><a href="/'.$row["slug"].'/">'.$row["title"].'</a></li>';
  }

}