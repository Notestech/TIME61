<?php
require_once("../link.php");
$sql = "select * from newsay order by time desc;";
$req = mysql_query($sql,$link);
if (!$req) {
	die("数据库查询失败:" . mysql_error());
}
//----------------------需要遍历输出-----------
// $row = mysql_fetch_assoc($req)
while ($row = mysql_fetch_assoc($req)) {
	$acountId = $row['owner'];

	$sql = "select AcountName, AcountFace from AcountInfo where Id = '{$acountId}' limit 1;";
	$req1 = mysql_query($sql,$link);
	$acountInfo = mysql_fetch_array($req1);
	$user = array(
		'name' => $acountInfo['0'],
		'tou'  => $acountInfo['1']
	);
	
	$newsay = array(
	'sayID'	  => $row['id'],
	// 'tou' 	  => $acountInfo['1'], 
// 	'user'		=> $acountInfo['0'],
	'user'		=> $user,
	'time' 		=> $row['time'],
	'content'	=> $row['content'],
	'imageURL'  => $row['imageURL']
 	);

	$newsays[] = $newsay;

	
}
echo json_encode($newsays);
?>