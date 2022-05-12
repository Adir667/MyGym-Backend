<?php
namespace Models;

class Exercise {

    public int $id;
    public string $name;
    public string $description;
    public string $image;
    public string $category_id;
    public Category $category;
 
}

?>