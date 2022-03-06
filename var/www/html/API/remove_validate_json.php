<?php
header('Content-Type: application/json');

$VALIDATE_JSON_PATH = "/var/www/html/speedboost/validate.json";

unlink($VALIDATE_JSON_PATH);
?>
