<?php
// je me connecte a la base de données avec la page connect.php
include "connect.php";
// je recupere d'abord l'identifiant  sur lequel j'ai cliquer dans l'url(avec $_GET)dan s la variable ci dessous 
$identifiant=$_GET["identifiant"];
// pour modifier les informations concernant un médécins je dois faire une autre requette pour selectionner les informations du médécins grace a son identifiant
$requette_modif="select * from medecins where numed=$identifiant";
// j'execute ma requette
$execute_modif=mysqli_query($id,$requette_modif);
// je récupére les données du médecin à partir du résultat de la requête
$resultat=mysqli_fetch_assoc($execute_modif);

// Quand la page se réactualise apres avoir appuyer sur le bouton pour modifier je dois creer une requette qui insere dans ma base de données les nouveaux informations concernant le médécin sélectionner
if(isset($_POST["bouton"])){
    // je recupere les données provenant du formulaire dans les variables ci dessous  
    $nom=$_POST["nom"];
    $prenom=$_POST["prenom"];
    $specialite=$_POST["specialite"];
    $service=$_POST["service"];
    // Avec cette requette je les modifie dans ma base de donnée 
    $requette="update medecins set nom='$nom', prenom='$prenom',specialite='$specialite',service='$service' where numed=$identifiant";
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
    <title>Modifier</title>
    <link rel="stylesheet" href="AjoutMedecin.css">
</head>
<body>
    <h1>Modifier les informations d'un médécin </h1><br><hr>
    <form action="" method="post">
        <input type="text" name="nom" value="<?=$resultat['nom']?>" placeholder="Nom du médécin" required><br><br>
        <input type="text" name="prenom" value="<?=$resultat['prenom']?>"  placeholder="Prenom du médécin" required><br><br>
        <select name="specialite" id="">
            <?php
         while($ligne=mysqli_fetch_assoc($execute)){
            if($ligne["specialite"]==$resultat["specialite"]){
           echo"<option value='$ligne[specialite]' selected>$ligne[specialite]</option>";
            }else{
                echo"<option value='$ligne[specialite]'>$ligne[specialite]</option>";   
            }
        }
            ?>
        </select><br><br>
        <input type="text" name="service"  value="<?=$resultat['service']?>" placeholder="Service du médécin" required><br><br>
        <input type="submit" value="Modifier" name="bouton">

    </form>
</body>
</html>