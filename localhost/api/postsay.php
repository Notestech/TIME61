<?php
require_once("../link.php");

$user = $_POST['user'];
$content = $_POST['content'];

//获取用户id
$sql = "SELECT id From AcountInfo WHERE AcountName = '{$user}' LIMIT 1";
$req = mysql_query($sql,$link);
if ($req && $row = mysql_fetch_assoc($req)) {
	
	$userID = $row['id'];

	//插入该条回复;
	$sql = "INSERT INTO newsay (owner,content) VALUES ('{$userID}','{$content}');";

	// $res = mysql_query($sql,$link) or die("error:".mysql.error());
	$res = mysql_query($sql,$link);
	echo(mysql_insert_id());
}

?>