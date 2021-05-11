<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>
<table width="616" height="49" border="1">
  <tr>
    <th width="295" height="43">Titre</th>
    <th width="305">Prix Mensuel</th>
  </tr>
  <?php
  	mysql_connect('localhost','root','') or die('Erreur de connexion');
	mysql_select_db('BD2014') or die('Erreur de connexion');
	$req="SELECT Titre,PrixMens FROM Revue";
	$res=mysql_query($req);
	while($T = mysql_fetch_array($res)){
		echo('  <tr>
    <td width="295" height="43">'.$T[0].'</td>
    <td width="305">'.$T[0].'</td>
  </tr>');
	}
  ?>
</table>
</body>
</html>
