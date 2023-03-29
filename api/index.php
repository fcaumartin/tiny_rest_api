<?php
##################################################
# Database parameters
##################################################
const DATABASE_HOST = "127.0.0.1";
const DATABASE_NAME = "hotel";
const DATABASE_USER = "admin";
const DATABASE_PASSWORD = "Afpa1234";
##################################################

$db = new PDO('mysql:host=' . DATABASE_HOST . ';dbname='. DATABASE_NAME .';charset=utf8mb4', DATABASE_USER, DATABASE_PASSWORD);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

header("Content-type: application/json");

$rm = $_SERVER["REQUEST_METHOD"];
$uri = $_SERVER["REQUEST_URI"];
$uri_element = explode("/", $uri);
$table = substr($uri_element[2], 0, -1);
$id = $uri_element[3];

$data = null;
switch($rm) {
    case "GET":
        if ($id)
            $data = get_item($db, $table, $id);
        else
            $data = get_items($db, $table);
    break;

    case "POST":
        $data = post_item($db, $table);
    break;
    
    case "PUT":
        $data = put_item($db, $table, $id);
    break;

    case "DELETE":
        delete_item($db, $table, $id);
    break;
}

if ($data)
    echo json_encode($data);
    


#####################################################
# Simple CRUD functions
#####################################################

function get_items($db, $table) {

    $prepared_query = $db->prepare("select * from $table");
    $result = $prepared_query->execute();

    return $result->fetchAll(PDO::FETCH_OBJ);
}

function get_item($db, $table, $id) {

    $prepared_query = $db->prepare("select * from $table where id=?");
    $result = $prepared_query->execute([$id]);

    return $result->fetch(PDO::FETCH_OBJ);
}


function post_item($db, $table) {
    $json = file_get_contents('php://input', true);
    $props = get_object_vars(json_decode($json));
    $values = array_values($props);
    $names = array_keys($props);
    $query = "insert into $table ";
    $query .= "(" . implode(",", $names) . ")";
    $query .= " values (" . implode(",", array_fill(0, count($names), '?')) . ")"; 
    // var_dump($query);
    // die;
    $prepared_query = $db->prepare($query);
    $prepared_query->execute($values);
    $id = $db->lastInsertId();

    return get_item($db, $table, $id);
}

function put_item($db, $table, $id) {
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
    
    return get_item($db, $table, $id);
}

function delete_item($db, $table, $id) {

    $prepared_query = $db->prepare("delete from $table where id=?");
    $result = $prepared_query->execute($id);

    return "";
}