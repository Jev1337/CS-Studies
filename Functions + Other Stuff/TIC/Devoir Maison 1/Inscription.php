<?php
$cin = $_POST['textbox1'];
$np = $_POST['textbox2'];
$prix = $_POST['S'];
$type = $_POST['R'];
if ($prix == 15.700){
	$lib = '4 Méga';
}
else if ($prix == 21.000){
	$lib = '8 Méga';
}
else $lib = '12 Méga';
if ($type == 'S')
$prix= $prix*6;
else $prix = $prix*12;
mysql_connect("localhost","root","") or die("Erreur de connexion!");
mysql_select_db("BDMalek") or die("Erreur de connexion!");
$rq = "SELECT * FROM abonnement WHERE CinA = '$cin'";
$rs = mysql_query($rq);
if (mysql_num_rows($rs) !=0){
	echo("CIN existant");
}
else{
	$rq = "INSERT INTO abonnement VALUES ('$cin','$np','$lib','$type','$prix','2021/04/07')";
	$rs= mysql_query($rq);
	echo("Vous êtes bien enregistré!");
}
?>