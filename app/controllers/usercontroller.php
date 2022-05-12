<?php

namespace Controllers;

use Exception;
use Services\UserService;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;


class UserController extends Controller
{
    private $service;

    // initialize services
    function __construct()
    {
        $this->service = new UserService();
    }

    function login() {
        
        $key = getenv("SECRET_KEY");
        $postedUser = $this->createObjectFromPostedJson("Models\\User");

        $user = $this->service->checkUsernamePassword($postedUser->username, $postedUser->password);
        if (!$user) {
            $this->respondWithError(403, "Forbidden");
            return;
        }

        $issuer = "http://localhost";
        $audience = "http://localhost";
        $issuedAt = time();
        $notBefore = time();
        $expires = time() + 1800;
        $data = [
            "username" => $user->username,
        ];
        $payload = [
            "iss" => $issuer,
            "aud" => $audience,
            "iat" => $issuedAt,
            "nfb" => $notBefore,
            "exp" => $expires,
            "data" => $data
        ];

        $JWT = JWT::encode($payload, $key, 'HS256');
        #$decoded = JWT::decode($jwt, new Key($key, 'HS256'));

        $respone = [
            "message" => "login successfully",
            "token" => $JWT,
            "timestamp" => $issuedAt
        ];

        $this->respondWithCode(201, $respone);
    }

    public function getAll()
    {
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
}
