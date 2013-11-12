<?php 
// $toys = array(
// 	"time61/upload/toys/toy_001.png",
// 	"time61/upload/toys/toy_002.png",
// 	"time61/upload/toys/toy_003.png",
// 	"time61/upload/toys/toy_004.png",
// 	"time61/upload/toys/toy_005.png",
// 	"time61/upload/toys/toy_006.png",
// );

require_once("../link.php");
$sql = "select * from ToyInfo;";
$req = mysql_query($sql,$link);
if (!$req) {
	die("数据库查询失败:" . mysql_error());
}
//----------------------需要遍历输出-----------
// $row = mysql_fetch_assoc($req)
while ($row = mysql_fetch_assoc($req)) {
	$acountId = $row['ToyOwner'];

	$sql = "select AcountName from AcountInfo where Id = '{$acountId}';";
	$req1 = mysql_query($sql,$link);
	$acountInfo = mysql_fetch_array($req1);

	$toy = array(
	'owner' 	  => $acountInfo['0'], 
	'paintingURL' => $row['ToyPaintingURL'],
	'modelURL'    => $row['ToyModelURL']
	);

	$toys[] = $toy;

	
}
echo json_encode($toys);
// echo array_to_json_string($toys);

 ?>