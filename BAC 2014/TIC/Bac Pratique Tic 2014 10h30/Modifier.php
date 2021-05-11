<?php
mysql_connect('localhost','root','') or die('Erreur de connexion');
mysql_select_db('BD2014') or die('Erreur de connexion');
$cin = $_POST['textbox1'];
$adr = $_POST['textbox2'];
$req= "SELECT * FROM Abonne WHERE Cin='$cin'";
$res=mysql_query($req);
if (mysql_num_rows($res) == 0){
	echo('Abonné inexistant');
}
else{
	$req="UPDATE Abonne SET Adresse='$adr' WHERE Cin='$cin'";
	$res=mysql_query($req);
	echo('Mise à jour effectué!');
}

?>