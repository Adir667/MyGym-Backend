<?php

namespace Controllers;

use Exception;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Services\ExerciseService;

class ExerciseController extends Controller
{
    private $service;

    // initialize services
    function __construct()
    {
        $this->service = new ExerciseService();
    }

    public function getAll()
    {
        $jwt = $this->checkForToken();
        if (!$jwt)
            return;

        $offset = NULL;
        $limit = NULL;

        if (isset($_GET["offset"]) && is_numeric($_GET["offset"])) {
            $offset = $_GET["offset"];
        }
        if (isset($_GET["limit"]) && is_numeric($_GET["limit"])) {
            $limit = $_GET["limit"];
        }

        $exercises = $this->service->getAll($offset, $limit);

        $this->respond($exercises);
    }

    function checkForToken () {

        $authHeader = $_SERVER['HTTP_AUTHORIZATION'] ?? false;

        if (!isset($authHeader)) {
            $this->respondWithError(403, "Forbidden");
            return;
        }

        $token = substr($authHeader, 7);
        $key = 'thisIsaSecret';
        try {
            $jwt = JWT::decode($token, new Key($key, 'HS256'));
            return true;
        }
        catch (Exception $e) {
            $this->respondWithError(401, $e->getMessage());
            return;
        }
    }

    public function getOne($id)
    {
        $exercise = $this->service->getOne($id);

        // we might need some kind of error checking that returns a 404 if the product is not found in the DB
        if (!$exercise) {
            $this->respondWithError(404, "Product not found");
            return;
        }

        $this->respond($exercise);
    }

    public function create()
    {
        try {
            $exercise = $this->createObjectFromPostedJson("Models\\Exercise");
            $exercise = $this->service->insert($exercise);
        } catch (Exception $e) {
            $this->respondWithError(500, $e->getMessage());
        }

        $this->respond($exercise);
    }

    public function update($id)
    {
        try {
            $exercise = $this->createObjectFromPostedJson("Models\\Exercise");
            $exercise = $this->service->update($exercise, $id);
        } catch (Exception $e) {
            $this->respondWithError(500, $e->getMessage());
        }

        $this->respond($exercise);
    }

    public function delete($id)
    {
        try {
            $this->service->delete($id);
        } catch (Exception $e) {
            $this->respondWithError(500, $e->getMessage());
        }

        $this->respond(true);
    }
}
