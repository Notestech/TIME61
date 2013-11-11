<?php
session_start();
require_once("../link.php");

$name = $_GET['name'];
$pwd = $_GET['pwd'];
echo "name:" . $name;
$sql = "select AcountName, AcountFace from TIME61.AcountInfo where AcountName = '{$name}' and AcountPassword = '{$pwd}';";
$req = mysql_query($sql,$link);
echo $req;
$result = mysql_fetch_assoc($req);

print_r($result);
if($result){
	echo "登入成功";

	$_SESSION['ACOUNTNAME'] = $result['AcountName'];
	$_SESSION['ACOUNTPASSWORD'] = $result['AcountFace'];
	echo $_SESSION['ACOUNTNAME'];
	echo $_SESSION['ACOUNTPASSWORD'] ;
}else{
	die("登入失败:" . mysql_error());

}

 ?>