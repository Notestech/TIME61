<?php 
session_start();

require_once("../link.php");

$name = $_POST["name"];
$pwd = $_POST["pwd"];
// $qq = $_POST["qq"];

$sql = "insert into AcountInfo (AcountName,AcountPassword) values('{$name}','{$pwd}');";
$req = mysql_query($sql,$link);
if (mysql_insert_id()) {
	echo ("YES");
}else{
	echo ("No");
}
?>