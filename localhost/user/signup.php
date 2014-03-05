<?php 
session_start();

require_once("../link.php");

$name = $_POST["name"];
$pwd = $_POST["pwd"];
$tou = "http://time61/upload/douding/douding0004.png";
// $qq = $_POST["qq"];

$sql = "insert into AcountInfo (AcountName,AcountPassword,AcountFace) values('{$name}','{$pwd}','{$tou}');";
$req = mysql_query($sql,$link);
echo (mysql_insert_id());

?>