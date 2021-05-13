<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>
<table width="707" border="1">
  <tr>
    <td width="279">Nom Prenom </td>
    <td width="169">Debit</td>
    <td width="237">Montant</td>
  </tr>
  <?php
mysql_connect("localhost","root","") or die("Erreur de connexion!");
mysql_select_db("BDMalek") or die("Erreur de connexion!");
$req = "SELECT NomPrenA,DebitA,MontantA FROM Abonnement WHERE TypeA = 'S' AND DateA BETWEEN '2016-01-01' AND '2016-05-30'";
$res = mysql_query($req);
while ($t = mysql_fetch_array($res)){
	echo('<tr><td>'.$t[0].'</td><td>'.$t[1].'</td><td>'.$t[2].'</td></tr>');
}
?>
</table>
</body>
</html>
