<?php
require_once("../link.php");

$sayID = $_GET['sayID'];
$content = $_GET['content'];
$user = $_GET['user'];
echo ($sayID);
echo ("<br/>");
echo ($content);
echo ("<br/>");
echo ($user);
echo ("<br/>");

//获取用户id
$sql = "SELECT id From AcountInfo WHERE AcountName = '{$user}' LIMIT 1";
$req = mysql_query($sql,$link);
if ($req && $row = mysql_fetch_assoc($req)) {
	
	$userID = $row['id'];

	//插入该条回复;
	$sql = "INSERT INTO `Replay` (`sayID`, `owner`,`content`) VALUES ('{$sayID}','{$userID}','{$content}')";

	// $res = mysql_query($sql,$link) or die("error:".mysql.error());
	$res = mysql_query($sql,$link)
	if (mysql_insert_id()) {
		echo ("YES");
	}
	
}else{
	echo ("NO");
}

?>