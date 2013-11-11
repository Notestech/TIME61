<?php 
session_start();

require_once("../link.php");

$name = $_POST["name"];
$pwd = $_POST["pwd"];

$sql = "insert into TIME61.AcountInfo (AcountName,AcountPassword) values('{$name}','{$pwd}');";
$req = mysql_query($sql,$link);
if(!$result = mysql_fetch_array($req)){
	die("注册失败:" . mysql_error());
}

 ?>