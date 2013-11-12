<?php 
require_once("../link.php");
$sql = "select * from PaintingInfo;";
$req = mysql_query($sql,$link);
if (!$req) {
	die("数据库查询失败:" . mysql_error());
}
// $result = mysql_fetch_array($req);
while ($result = mysql_fetch_array($req)){
	$acountId = $result['3'];
	$sql = "select AcountName from AcountInfo where Id = '{$acountId}';";
	$req1 = mysql_query($sql,$link);
	$acountInfo = mysql_fetch_array($req1);


	$painting = array(
	'paintingURL' 			=> $result['1'],
	'title' 		=> $result['2'],
	'owner' 		=> $acountInfo['0'],
	'share_count'	=> (string)$result['4'],
	'comment_count' => (string)$result['5'],
	'love_count' 	=> (string)$result['6'],
	);
	$paintings[] = $painting;
}

echo json_encode($paintings);
// echo array_to_json_string($paintings);

// echo "<pre>";
// echo "</pre>";

function array_to_json_string($arraydata) {
		$output = "";
		$output .= "{";
		foreach($arraydata as $key=>$val){
			if (is_array($val)) {
				$output .= "\"".$key."\" : [{";
					foreach($val as $subkey=>$subval){
						$output .= "\"".$subkey."\" : \"".$subval."\",";
					}
				$output .= "}],";
			} else {
				$output .= "\"".$key."\" : \"".$val."\",";
			}
		}
		$output .= "}";
		return $output;
	}

 ?>