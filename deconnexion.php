<?php
// j'ouvre aussi la session ici
session_start();
include"connect.php";
// je veux aussi remplacer la date de fin a travers une requette 
if(isset($_SESSION['idc'])) {
    $idc=$_SESSION['idc'];
 //j'ajoute une ligne sur la table connexion avec la date de mtn date() en php
 $requette = "UPDATE connexions SET dateFin = NOW() WHERE num_sessions = '$idc'";
 // j'execute la requette 
 $execute=mysqli_query($id,$requette);
// je detruit la section pour que quand une autre personne veux acceder a la page ListeMedecin.php il doit se reconnecter 
session_destroy();
// je redirige la page vers connexion.php 
header("location:connexion.php");
}

?>