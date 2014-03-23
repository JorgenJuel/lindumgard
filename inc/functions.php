<?php

class Page{
  public $slug;
  public $template = "templates/page.php";
  public static $connect;
  public $id;
  public $title;
  public $content;
  public $excerpt;
  public $modified;
  public $sidebar;
  public $forfatter;
  public $epost;


  /**
   * Assigns slug
   *
   * retrieves and sets page data
   *
   * @param PDO Object $conn
   *
   * @return void
   */
  function __construct($connect)
  {

    self::$connect = $connect;

    $this->assignSlug();

    // If page is home, add hardcoded data
    if($this->slug == "home"){
      $this->title = "Hjem";
      $this->template = "templates/home.php";
    }else{
      $this->retrievePage();
    }
  }

  /**
   * Queries the "innhold" database for page content. 
   * Merges content from PDO object into this class
   *
   * @return void
   */
  protected  function retrievePage()
  {
    try{
      $stmt = self::$connect->prepare("
        SELECT innhold.id AS id, slug, title, content, excerpt, created, modified, template, sidebar, concat(fornavn, ' ', etternavn) AS forfatter, epost 
        FROM innhold 
        LEFT OUTER JOIN forfatter ON author = forfatter.id 
        WHERE slug = :slug 
        LIMIT 1;"
      );
      $stmt->bindParam(":slug", $this->slug, PDO::PARAM_STR);
      $stmt->setFetchMode(PDO::FETCH_INTO, $this);
      $stmt->execute();
      //$result = $stmt->fetchAll(PDO::FETCH_OBJ);
    }catch(PDOException $e){
      // Exception found, issue with MYSQL connection
      echo 'ERROR: '. $e->getMessage();
    }

    // No results fetched, page not found, look for template
    if($stmt->rowCount() == 0){
      $this->findTemplate();
    }else{
      $stmt->fetch();
      if(empty($this->template)){
        $this->template = "templates/page.php";
      }
    }
  }

  /**
   * Assigns Slug property with content of query parameter "q"
   *
   * @return void
   */
  protected function assignSlug()
  {
    if(isset($_GET["q"])){
      $this->slug = $_GET["q"];
    }else{
      $this->slug = "home";
    }
  }

  /**
   * Search through directory for template files.
   * Assigns template if found
   * If not found, it assigns the 404 template.
   *
   * @return void
   */
  protected function findTemplate()
  {
    // Scan Directory for files
    $pages = scandir("templates");

    // Filter and search for slug within files
    $slug = $this->slug;
    $template = array_filter(
        $pages, 
        function($var) use ($slug) { 
          return preg_match("/\b$slug\b/i", $var); 
        }
    );

    //Get first element of array
    $template = array_shift($template);

    // If template is not found
    if(is_null($template)){
      $this->template = "templates/404.php";

    // If template is found
    }else{
      $this->template = "templates/" . $template;
      $this->slug = "404";
      $this->title = "Page could not be found (error 404)";
    }

  }
  /**
   * Queries menu database for menu items
   *
   * @return Array of Objects containing menu information
   */
  public static function getMenu()
  {
    try{
      $stmt = self::$connect->prepare('SELECT meny.id, meny.title, slug FROM meny INNER JOIN innhold ON meny.item = innhold.id; ');  
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
}
