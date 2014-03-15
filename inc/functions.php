<?php
if(isset($_GET["q"])){
  $slug = $_GET["q"];
}else{
  $slug = "home";
}
function get_page(){
  global $slug;
  global $conn;
  if($slug == "home"){
    $return = new stdClass;
    $return->slug = "home";
    $return->title = "Hjem";
    return $return;
  }
  try{
    $stmt = $conn->prepare('SELECT innhold.id, slug, title, content, excerpt, created, modified, sidebar, concat(fornavn, " ", etternavn) AS forfatter, epost FROM innhold LEFT OUTER JOIN forfatter ON author = forfatter.id WHERE slug = :slug LIMIT 1;');  
    $stmt->execute(array('slug' => $slug));
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    if(count($result)){
      return $result[0];
    }else{
      $return = new stdClass;
      $return->slug = "404";
      $return->title = "Page could not be found (error 404)";
      return $return;
    }
  }catch(PDOException $e){
    echo 'ERROR: '. $e->getMessage();
  }
}

function get_menu(){
  global $slug;
  global $conn;
  try{
    $stmt = $conn->prepare('SELECT meny.id, meny.title, slug FROM meny INNER JOIN innhold ON meny.item = innhold.id; ');  
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    if(count($result)){
      return $result;
    }else{
      return 0;
    }
  }catch(PDOException $e){
    echo 'ERROR: '. $e->getMessage();
  }
}