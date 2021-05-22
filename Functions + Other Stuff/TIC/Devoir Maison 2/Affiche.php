<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>
<?php
mysql_connect('localhost','root','') or die('Erreur de connexion');
mysql_select_db('BDSPORT') or die('Erreur de connexion');
$req="SELECT COUNT(Code) FROM Athlete";
$res=mysql_query($req);
$T=mysql_fetch_array($res);
echo("Le nombre total des athlètes: ".$T[0]."<br>");
$req="SELECT Discipline, NomPren, DateC, Record FROM Athlete A, Competition C WHERE A.Code = C.Code GROUP BY Discipline ORDER BY Record DESC";
$res=mysql_query($req);
while($T=mysql_fetch_array($res)){
echo('<table width="856" border="1">
  <tr>
    <th colspan="2" scope="col">Discipline: '.$T[0].'</th>
  </tr>
  <tr>
    <td>Nom Pr&eacute;nom</td>
    <td>'.$T[1].'</td>
  </tr>
  <tr>
    <td>Date</td>
    <td>'.$T[2].'</td>
  </tr>
  <tr>
    <td>Record</td>
    <td>'.$T[3].'</td>
  </tr>
</table><br><hr><br>');
}
?>
</body>
</html>
