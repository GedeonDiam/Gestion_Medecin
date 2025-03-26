<?php
session_start();
if (!isset($_SESSION["login"])) {
    header("location:connexion.php?=Veuillez_vous_connecter");
}
?>
<!-- je veux creer un tableau qui affiche le login et le temps de connexion de chaque utilisateur -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="ListeMedecin.css">

</head>
<body>
<h1>Login et temps de chaque utilisateur<br> <a href="AjoutMedecin.php">Ajouter un nouveau Médécin</a> <br> <a href='deconnexion.php'>Déconnectez-vous</a></h1>
        <table>
            <tr>
                <th>Login</th>
                <th>Temps de connexion(en seconde)</th>
            </tr>
            <!-- Afficher les resulyats de chaque colonne avec la boucle while(tant qu'on peut recupérer une ligne qu'il m'affiche le résultat) -->
        <?php
        // je me connecte a la base de donnée
        include "connect.php";
        // je lance une requette
        $requette="SELECT login, SUM(TIMESTAMPDIFF(SECOND, dateDeb, IFNULL(dateFin, NOW()))) AS temps_passé_en_seconde FROM connexions GROUP BY login;";
        // j'execute ma requette 
        $execute=mysqli_query($id,$requette);
        while ($ligne = mysqli_fetch_assoc($execute)) {
            // je recupere les informations dans ma base de données
            $login = $ligne["login"];
            $time=$ligne["temps_passé_en_seconde"];
            echo " <tr><td> $login</td><td>$time</td></tr>";
        }
        ?>

        </table>
        
</body>
</html>