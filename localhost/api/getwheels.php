<?php
require_once("../link.php");
$sql = "select imageURL from wheels order by time desc;";
$req = mysql_query($sql,$link);
if (!$req) {
	die("数据库查询失败:" . mysql_error());
}
//----------------------需要遍历输出-----------
// $row = mysql_fetch_assoc($req)
while ($row = mysql_fetch_assoc($req)) {
	$wheel = array(
		'imageURL' => $row['imageURL']
	);

	$wheels[] = $wheel;

	
}
echo json_encode($wheels);
?>