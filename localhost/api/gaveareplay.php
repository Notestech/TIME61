<?php
require_once("../link.php");

$sayID = $_POST['sayID'];
$user = $_POST['user'];
$content = $_POST['content'];
// echo ($sayID);
// echo ("<br/>");
// echo ($content);
// echo ("<br/>");
// echo ($user);
// echo ("<br/>");

//获取用户id
$sql = "SELECT id From AcountInfo WHERE AcountName = '{$user}' LIMIT 1";
$req = mysql_query($sql,$link);
if ($req && $row = mysql_fetch_assoc($req)) {
	
	$userID = $row['id'];

	//插入该条回复;
	$sql = "INSERT INTO `Replay` (`sayID`, `owner`,`content`) VALUES ('{$sayID}','{$userID}','{$content}')";

	// $res = mysql_query($sql,$link) or die("error:".mysql.error());
	$res = mysql_query($sql,$link);
	echo(mysql_insert_id());
}

?>