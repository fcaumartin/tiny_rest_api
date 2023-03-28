<?php
##################################################
# Database parameters
##################################################
const DATABASE_HOST = "127.0.0.1";
const DATABASE_NAME = "hotel";
const DATABASE_USER = "dbuser";
const DATABASE_PASSWORD = "fakefake";
##################################################

$db = new PDO('mysql:host=' . DATABASE_HOST . ';dbname='. DATABASE_NAME .';charset=utf8mb4', DATABASE_USER, DATABASE_PASSWORD);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

header("Content-type: application/json");

$rm = $_SERVER["REQUEST_METHOD"];
$uri = $_SERVER["REQUEST_URI"];
$uri_element = explode("/", $uri);
$table = substr($uri_element[2], 0, -1);
$id = $uri_element[3];


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
        $props = get_object_vars($data);
        $values = array_values($props);
        $names = array_keys($props);
        // var_dump($values);
        $query = "insert into $table ";
        $query .= "(" . implode(",", $names) . ")";
        $query .= " values (" . implode(",", array_fill(0, count($names), '?')) . ")"; 
        // var_dump($query);
        // die;
        $prepared_query = $db->prepare($query);
        $prepared_query->execute($values);
        $id = $db->lastInsertId();
        $query = "select * from $table where id=$id";
    break;
    
    case "PUT":
        $json = file_get_contents('php://input', true);
        $data = json_decode($json);
        $props = get_object_vars($data);
        $values = array_values($props);
        $names = array_keys($props);
        $set_names = array_map(fn($v): string => $v."=?", $names);
        // var_dump($values);
        $query = "update $table ";
        $query .= "set " . implode(",", $set_names);
        $query .= " where id=?";
        array_push($values, $id);
        // var_dump($query);
        // die;
        $prepared_query = $db->prepare($query);
        $prepared_query->execute($values);
        // $id = $db->lastInsertId();
        $query = "select * from $table where id=$id";
    break;

    case "DELETE":
        $query = "delete from $table";
        $query .= " where id=$id";
    break;
}


    $request = $db->query($query);
    if ($id) {
        $result = $request->fetch(PDO::FETCH_OBJ);
    }
    else {
        $result = $request->fetchAll(PDO::FETCH_OBJ);
    }
    echo json_encode($result);


#####################################################
# Simple CRUD functions
#####################################################

function get_ressources($db, $table) {

    $prepared_query = $db->prepare("select * from $table");
    $result = $prepared_query->execute();

    return $result->fetchAll(PDO::FETCH_OBJ);
}

function get_ressource($db, $table, $id) {

    $prepared_query = $db->prepare("select * from $table where id=?");
    $result = $prepared_query->execute($id);

    return $result->fetch(PDO::FETCH_OBJ);
}


function post_ressource($db, $table) {

}

function put_ressource($db, $table, $id) {

}

function delete_ressource($db, $table, $id) {

}