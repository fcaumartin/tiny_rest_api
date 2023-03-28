<?php
##################################################
# Database parameters
##################################################
const DATABASE_HOST = "127.0.0.1";
const DATABASE_NAME = "hotel";
const DATABASE_USER = "dbuser";
const DATABASE_PASSWORD = "fakefake";
##################################################


header("Content-type: application/json");

$rm = $_SERVER["REQUEST_METHOD"];
$uri = $_SERVER["REQUEST_URI"];
$uri_element = explode("/", $uri);
$table = substr($uri_element[2], 0, -1);
$id = $uri_element[3];


// echo ($rm) . "\n";
// echo ($uri) . "\n";
// echo json_encode($uri_element) . "\n";
// echo json_encode($table) . "\n";
// echo json_encode($id) . "\n";

$query = "";
$data = null;

switch($rm) {
    case "GET":
        $query = "select * from $table";
        if ($id) {
            $query .= " where id=$id";
        }
    break;

    case "POST":
        $json = file_get_contents('php://input', true);
        $data = json_decode($json);
        var_dump($data);
        die;
        $query = "insert into $table ";
        if ($id) {
            $query .= " where id=$id";
        }
    break;
    
    case "PUT":

    break;

    case "DELETE":
        $query = "select * from $table";
        if ($id) {
            $query .= " where id=$id";
        }
    break;
}


// echo "\n" . $query . "\n";

$db = new PDO('mysql:host=' . DATABASE_HOST . ';dbname='. DATABASE_NAME .';charset=utf8mb4', DATABASE_USER, DATABASE_PASSWORD);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if ($data) {
    $request = $db->query($query);
    if ($id) {
        $result = $request->fetch(PDO::FETCH_OBJ);
    }
    else {
        $result = $request->fetchAll(PDO::FETCH_OBJ);
    }
    echo json_encode($result);
}
else {
    $request = $db->query($query);
    if ($id) {
        $result = $request->fetch(PDO::FETCH_OBJ);
    }
    else {
        $result = $request->fetchAll(PDO::FETCH_OBJ);
    }
    echo json_encode($result);
}