<?php
header('Content-Type: application/json');

$VALIDATE_JSON_PATH="/Library/WebServer/Documents/speedboost/validate.json";

if (!file_exists($VALIDATE_JSON_PATH)) {
    $error = array(
        "errorMsg" => "file ".$VALIDATE_JSON_PATH." does not exits",
        "errorCode" => "404" 
    );
    echo json_encode($error);
    exit(404);
}

$contents = file_get_contents($VALIDATE_JSON_PATH);//, false, stream_context_create($OPTS));
$obj = array(
    "contents" => $contents
);
echo json_encode($obj);
?>