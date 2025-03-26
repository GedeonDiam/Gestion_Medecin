<?php
// j'ouvre une session pour pouvoir enregistrer le login
session_start();
// si je clique sur le bouton
if(isset($_POST["bouton"])){
    // je me connect a la base de donnée
    include "connect.php";
   // je creer maintenant des variables pour récupérer les informations de mon formulaire 
   $email=$_POST['email'];
   $login=$_POST['login'];
   $mdp=$_POST['mdp'];
    // je lance une requette qui verifie dans la base de données si les informations entrés dans le formulaire y existe  
    $requette= "select login,email,mdp from user where login='$login' and email='$email' and mdp='$mdp'";
    // j'execute ma requette 
    $executer=mysqli_query($id,$requette);
    // si le nombre de lignes résultantes de l'execution  de ma requête est supérieur à zéro alors je redirige ma page vers ListeMedecin.php sinon je redirige vers connexion.php?=erreur_informations 
    if(mysqli_num_rows($executer)>0){
        $_SESSION["login"]=$login;
        $_SESSION['idc']=session_id();
        $idc=$_SESSION['idc'];
        //j'ajoute une ligne sur la table connexion avec la date de mtn date() en php
        $requette="INSERT INTO connexions (login, dateDeb, dateFin, num_sessions) VALUES ('$login', NOW(), NULL, '$idc')";
        // j'execute la requette 
        $execute=mysqli_query($id,$requette);
        header("location:ListeMedecin.php");
    }else
    {
        header("location:connexion.php?=erreur_informations");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link rel="stylesheet" href="connexion.css">
</head>
<body>
    <div><h1>Connectez-vous <br> ou <br><a href="inscrire.php">Inscrivez-vous</a></h1></div>
    <form action="" method="post">
        <input type="email" name="email" placeholder="Entrez votre mail"required><br><br>
        <input type="text" name="login" placeholder="Entrez votre login"required><br><br>
        <input type="password" name="mdp" placeholder="Entrez votre mot de passe"required><br><br>
        <input type="submit" value="Se connecter" name="bouton" >
    </form>
</body>
</html>