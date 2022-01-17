<?php
header('Content-Type: application/json');

$cmd = "ifconfig";
$data = shell_exec($cmd);
if (is_null($data) || !$data) {
    $result = array(
        "errorMsg" => $cmd." command failed",
        "errorCode" => "500"
    );
    echo json_encode($result);
    exit(500);
}
preg_match_all("/\b(\w+): flags/", $data, $matches);
if (is_null($matches[1]) || count($matches[1]) == 0) {
    $result = array(
        "errorMsg" => "no interfaces found",
        "errorCode" => "404"
    );
    echo json_encode($result);
    exit(404);
} 
$obj = array(
    "interfaces" => $matches[1]
);
echo json_encode($obj);
?>