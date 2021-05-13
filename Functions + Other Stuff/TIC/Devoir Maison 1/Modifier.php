<?php
$cin = $_POST['textbox1'];
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
$rq = "SELECT * FROM Abonnement WHERE CinA = '$cin'";
$rs = mysql_query($rq);
if (mysql_num_rows($rs) ==0){
	echo("CIN inexistant");
}
else
{
$rq = "UPDATE Abonnement SET DebitA = '$lib', TypeA = '$type', MontantA = '$prix' WHERE CinA = '$cin'";
$rs = mysql_query($rq);
echo("Votre abonnement a bien été modifié!");
}

?>