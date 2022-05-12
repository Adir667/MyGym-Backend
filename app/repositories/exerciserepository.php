<?php

namespace Repositories;

use Models\Category;
use Models\Exercise;
use PDO;
use PDOException;
use Repositories\Repository;

class ExerciseRepository extends Repository
{
    function getAll($offset = NULL, $limit = NULL)
    {
        try {
            $query = "SELECT exercise.*, category.name as category_name FROM exercise INNER JOIN category ON exercise.category_id = category.id";
            if (isset($limit) && isset($offset)) {
                $query .= " LIMIT :limit OFFSET :offset ";
            }
            $stmt = $this->connection->prepare($query);
            if (isset($limit) && isset($offset)) {
                $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
                $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
            }
            $stmt->execute();

            $exercises = array();
            while (($row = $stmt->fetch(PDO::FETCH_ASSOC)) !== false) {               
                $exercises[] = $this->rowToProduct($row);
            }

            return $exercises;
        } catch (PDOException $e) {
            echo $e;
        }
    }

    function getOne($id)
    {
        try {
            $query = "SELECT exercise.*, category.name as category_name FROM exercise INNER JOIN category ON exercise.category_id = category.id WHERE exercise.id = :id";
            $stmt = $this->connection->prepare($query);
            $stmt->bindParam(':id', $id);
            $stmt->execute();

            $stmt->setFetchMode(PDO::FETCH_ASSOC);
            $row = $stmt->fetch();
            $exercise = $this->rowToProduct($row);

            return $exercise;
        } catch (PDOException $e) {
            echo $e;
        }
    }

    function rowToProduct($row) {
        $exercise = new Exercise();
        $exercise->id = $row['id'];
        $exercise->name = $row['name'];
        $exercise->description = $row['description'];
        $exercise->image = $row['image'];
        $exercise->category_id = $row['category_id'];
        $category = new Category();
        $category->id = $row['category_id'];
        $category->name = $row['category_name'];

        $exercise->category = $category;
        return $exercise;
    }

    function insert($exercise)
    {
        try {
            $image = "https://cdn-icons-png.flaticon.com/512/456/456249.png";
            $stmt = $this->connection->prepare("INSERT into exercise (name, description, image, category_id) VALUES (?,?,?,?)");

            $stmt->execute([$exercise->name, $exercise->description, $image, $exercise->category_id]);

            $exercise->id = $this->connection->lastInsertId();

            return $this->getOne($exercise->id);
        } catch (PDOException $e) {
            echo $e;
        }
    }


    function update($exercise, $id)
    {
        try {
            $stmt = $this->connection->prepare("UPDATE exercise SET name = ?, description = ?, category_id = ? WHERE id = ?");

            $stmt->execute([$exercise->name, $exercise->description, $exercise->category_id, $id]);

            return $this->getOne($id);
        } catch (PDOException $e) {
            echo $e;
        }
    }

    function delete($id)
    {
        try {
            $stmt = $this->connection->prepare("DELETE FROM exercise WHERE id = :id");
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            return;
        } catch (PDOException $e) {
            echo $e;
        }
        return true;
    }
}
