<?php
header('Content-Type: application/json');

$VALIDATE_JSON_PATH = "/var/www/html/speedboost/validate.json";

$json = file_get_contents("php://input");
$obj = json_decode($json);
$contents = $obj->contents;
$result = file_put_contents($VALIDATE_JSON_PATH, $contents);
$msg = array(
    "result" => $result
);
echo json_encode($msg);
?>
