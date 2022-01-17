<?php
header('Content-Type: application/json');

$VALIDATE_JSON_PATH = "/Library/WebServer/Documents/speedboost/validate.json";

if (!file_exists($VALIDATE_JSON_PATH)) {
    $error = array(
        "errorMsg" => "file ".$VALIDATE_JSON_PATH." does not exits",
        "errorCode" => "404" 
    );
    echo json_encode($error);
    exit(404);
}

$json = file_get_contents("php://input");
$obj = json_decode($json);
$contents = $obj->contents;
$result = file_put_contents($VALIDATE_JSON_PATH, $contents);
$msg = array(
    "result" => $result
);
echo json_encode($msg);
?>