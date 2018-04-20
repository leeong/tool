<?php
require_once 'db.php';
$config = include('config.php');

$conn = new DB($argv);

if (isset($argv[2]) && $argv[2] != '') {
    $config = $config[$argv[1]];
} else {
    $config = $config['default'];
}
$tableName = end($argv);
$sql = <<< POD
show create table {$tableName}
POD;


$demo = $conn->query($sql);

$str = $demo->fetchColumn(1);
if (isset($config['log']) && $config['log']) {
    file_put_contents($config['log'], "\n" . $str . ";\n\n", FILE_APPEND);
}
echo "===================================================" .
    "\n" . $str . ";\n" .
    '===================================================';
