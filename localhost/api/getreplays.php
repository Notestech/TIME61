<?php
require_once("../link.php");

$sayID = $_GET['sayID'];
// $sayID = 1;

$sql = "select * from Replay where sayID = '{$sayID}' order by time desc;";
$req = mysql_query($sql,$link);
if (!$req) {
	die("数据库查询失败:" . mysql_error());
}
//----------------------需要遍历输出-----------
// $row = mysql_fetch_assoc($req)
while ($row = mysql_fetch_assoc($req)) {
	$acountId = $row['owner'];

	$sql = "select AcountName, AcountFace from AcountInfo where Id = '{$acountId}';";
	$req1 = mysql_query($sql,$link);
	$acountInfo = mysql_fetch_array($req1);
	$user = array(
		'name' => $acountInfo['0'],
		'tou'  => $acountInfo['1']
	);
	$replay = array(
	'user'		=> $user,
	'time' 		=> $row['time'],
	'content'	=> $row['content']
	);
// echo json_encode($replay);
// echo ("<br/><br/>");
	$replays[] = $replay;

	
}
echo json_encode($replays);
?>