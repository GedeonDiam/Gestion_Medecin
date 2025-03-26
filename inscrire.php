<?php
// j'ouvre aussi la session start ici pour recuperer $_SESSION["login"] parceque sans ca lorsque la page se redirige vers ListeMedecin il est directement renvoyez vers connexion.php
session_start();
// si j'appuie sur le bouton pour s'inscrire
if (isset($_POST["bouton"])) {
    // je me connecte a la base de données
    include "connect.php";
    // je recupere les informations remplies dans les formulaires dans des variables
    $nom =mysqli_real_escape_string($id, $_POST["nom"]);
    $prenom =mysqli_real_escape_string($id, $_POST["prenom"]);
    $email =mysqli_real_escape_string($id, $_POST["email"]);
    $login =mysqli_real_escape_string($id, $_POST["login"]);
    $mdp =mysqli_real_escape_string($id, $_POST["mdp"]);
    if (!empty($nom) && !empty($prenom) && !empty($email) && !empty($login) && !empty($mdp)) {
        $resultat = mysqli_query($id, "select * from user where login='$login'");
        if (!mysqli_num_rows($resultat) > 0) {
            // j'attribue la variable $login a $_SESSION["login"] pour que arriver sur la page ListeMedecins.php je ne soit pas rediriger vers connexion.php
            $_SESSION["login"] = $login;
            //je lance une requette
            $requette = "insert into user (nom,prenom,email,login,mdp) values ('$nom','$prenom','$email','$login','$mdp')";
            // j'execute ma requette 
            $executer = mysqli_query($id, $requette);
            header("location:connexion.php");
        } else {
            echo 'le login existe deja';
        }
    } else {
        echo 'Tout les champs ne sont pas remplies veuillez tous les remplir';
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscrire</title>
    <link rel="stylesheet" href="inscrire.css">
</head>

<body>
    <div>
        <h1>Inscrivez-vous</h1>
    </div>
    <form action="" method="post">
        <input type="text" name="nom" placeholder="Entrez votre nom"><br><br>
        <input type="text" name="prenom" placeholder="Entrez votre prenom"><br><br>
        <input type="email" name="email" placeholder="Entrez votre mail"><br><br>
        <input type="text" name="login" placeholder="Entrez votre login"><br><br>
        <input type="password" name="mdp" placeholder="Entrez votre mot de passe"><br><br>
        <input type="submit" value="S'inscrire" name="bouton">
    </form>
</body>

</html>