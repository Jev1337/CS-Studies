<?php
$cin = $_POST['textbox1'];
mysql_connect("localhost","root","") or die("Erreur de connexion!");
mysql_select_db("BDMalek") or die("Erreur de connexion!");
$rq = "SELECT * FROM Abonnement WHERE CinA = '$cin'";
$rs = mysql_query($rq);
if (mysql_num_rows($rs) == 0){
	echo("CIN inexistant");
}
else{
$rq = "DELETE FROM Abonnement WHERE CinA= '$cin'";
$rs = mysql_query($rq);
echo("L'abonnement a bien été annulé!");
}
?>