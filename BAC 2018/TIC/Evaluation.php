
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>

<p>
  <?php
//Tâche 1:
mysql_connect('localhost','root','') or die('Erreur de connexion!');
mysql_select_db('BD1337');
$idhotel = $_POST['S'];
$eval1 = $_POST['R1'];
$eval2= $_POST['R2'];
$k=0;
if (isset($_POST['R3'])){
	$k= $k + $_POST['R3'];
}
if (isset($_POST['R4'])){
	$k= $k + $_POST['R4'];
}
if (isset($_POST['R5'])){
	$k= $k + $_POST['R5'];
}
$date = date("Y-m-d");
$req= "SELECT * FROM Evaluation WHERE IdHotel = '$idhotel'";
$res = mysql_query($req);
if (mysql_num_rows($res) != 0) {
	echo('Cet hôtel est déjà évalué!');
}
else{
	$req = "INSERT INTO Evaluation VALUES ('$date','$idhotel','$eval1','$eval2','$k')";
	mysql_query($req);
	echo('Evaluation enregistrée avec succès');
}
?>
</p>
<table width="1034" height="37" border="1">
  <tr>
    <th width="38" scope="col">N&deg;</th>
    <th width="362" scope="col">H&ocirc;tel</th>
    <th width="200" scope="col">Accueil</th>
    <th width="200" scope="col">Restauration</th>
    <th width="200" scope="col">Extra</th>
  </tr>
  <?php 
	//Tâche 2:
  	$i=0;
	$req = "SELECT NomHotel,AVG(NoteAccueil),AVG(NoteRest),AVG(NoteExtra) FROM Evaluation E, Hotel H WHERE E.IdHotel = H.IdHotel GROUP BY NomHotel";
	$res = mysql_query($req);
	while ($T= mysql_fetch_array($res)){
	$i++;
  	echo('<tr>
    <td>'.$i.'</td>
    <td>'.$T[0].'</td>
    <td>'.$T[1].'</td>
    <td>'.$T[2].'</td>
    <td>'.$T[3].'</td>
  </tr>');
  }
  ?>
</table>
<p>&nbsp;</p>
</body>
</html>
