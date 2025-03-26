<?php
// j'ouvre aussi la session ici
session_start();
// si je le login de la session n'exite pas je ne pourrais pas entrer dans la page AjoutMedecin.php
if (!isset($_SESSION["login"])) {
    header("location:connexion.php?=Veuillez_vous_connecter");
}
// je me connecte a la base de données avec la page connect.php
include "connect.php";
// Quand la page se réactualise apres avoir appuyer sur le bouton je dois creer une requette qui insere dans ma base de données les informations concernant le nouveau médécin ajouté
if(isset($_POST["bouton"])){
    // je recupere les données provenant du formulaire dans les variables ci dessous  
    $nom=$_POST["nom"];
    $prenom=$_POST["prenom"];
    $specialite=$_POST["specialite"];
    $service=$_POST["service"];
    // Avec cette requette je les insères dans ma base de donnée 
    $requette="insert into medecins (numed,nom,prenom,specialite,service) values (null,'$nom','$prenom','$specialite','$service')";
    // j'execute maintenant ma requette 
    $execute=mysqli_query($id,$requette);
    // Apres avoir executer ma requette je retourne sur ma page ListeMedecin.php 
    header("location:ListeMedecin.php");
}
// je lance une requette
$requette="select distinct specialite from medecins order by specialite";
// j'execute ma requette 
$execute=mysqli_query($id,$requette)
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter</title>
    <link rel="stylesheet" href="AjoutMedecin.css">
</head>
<body>
   <h1>Ajouter un médécin </h1><br><hr>
    <form action="" method="post">
        <input type="text" name="nom" placeholder="Nom du médécin" required><br><br>
        <input type="text" name="prenom" placeholder="Prenom du médécin" required><br><br>
        <select name="specialite" id="">
            <option value="" disabled selected>Specialité du médécin</option>
            <?php
         while($ligne=mysqli_fetch_assoc($execute)){
           echo"<option value='$ligne[specialite]'>$ligne[specialite]</option>";
         }
            ?>
        </select><br><br>
        <input type="text" name="service" placeholder="Service du médécin" required><br><br>
        <input type="submit" value="Enregistrer" name="bouton">

    </form>
</body>
</html>