<?php
// pour supprimer la ligne que j'appuie je dois d'abord me connecter 
include "connect.php";
// je recupere d'abord l'identifiant  sur lequel j'ai cliquer dans l'url(avec $_GET)dan s la variable ci dessous 
$identifiant=$_GET["identifiant"];
// lancer une requette 
$requette="delete from medecins where numed=$identifiant";
// j'execute ma requette 
$executer=mysqli_query($id,$requette);
// je relance directement ma page et la ligne selectionnée sera directement supprimée
header("location:ListeMedecin.php");
?>