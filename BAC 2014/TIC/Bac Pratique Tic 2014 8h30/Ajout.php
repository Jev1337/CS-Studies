<?php
$Mat = $_POST['textbox1'];
$Nom = $_POST['textbox2'];
$Prenom = $_POST['textbox3'];
$Genre = $_POST['R'];
$Email = $_POST['textbox4'];
mysql_connect('localhost','root','') or die('Erreur de connexion!');
mysql_select_db('BD2015') or die ('ERREUR DE BD!');
$req = "SELECT * FROM Pilote WHERE Matricule='$Mat'";
$res = mysql_query($req);
if (mysql_num_rows($res) != 0){
	echo("Pilote déja existant!");
}
else{
	$req = "INSERT INTO Pilote VALUES ('$Mat','$Nom','$Prenom','$Genre','$Email')";
	$res = mysql_query($req);
	echo("Insertion de pilote effectuée avec succées");
}
?>