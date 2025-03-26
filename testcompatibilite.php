<?php

// si je le login de la session n'exite pas je ne pourrais pas entrer dans la page ListeMedecin.php
if (!isset($_SESSION["login"])) {
    header("location:connexion.php?=Veuillez_vous_connecter");
}
// je me connecte a la base de données avec la page connect.php
include "connect.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test de compatibilite</title>
    <link rel="stylesheet" href="ListeMedecin.css">
</head>

<body>
    <h1>Test de compatibilite de deux médicaments</h1>

    <form action="" method="get" style="text-align: center;">
        <div>
            <select name="medicament1">
                <option value="" disabled selected>Selectionner le médicament 1</option>
                <?php
                $requette1 = "select * from medicaments order by designation";
                // j'execute ma requette
                $execute1 = mysqli_query($id, $requette);
                while ($ligne1 = mysqli_fetch_assoc($execute1)) {
                    echo "<option value='$ligne1[designation]'>$ligne1[designation]</option>";
                }
                ?>
            </select><br><br>
            <select name="medicament2">
                <option value="" disabled selected>Selectionner le médicament 2</option>
                <?php
                $requette2 = "select * from medicaments order by designation";
                // j'execute ma requette
                $execute2 = mysqli_query($id, $requette);
                while ($ligne2 = mysqli_fetch_assoc($execute2)) {
                    echo "<option value='$ligne2[designation]'>$ligne2[designation]</option>";
                }
                ?>
            </select><br><br>
            <button type="submit" name="tester" required>Tester la compatibilité</button>
            <?php
            if (isset($_GET["tester"])) {
                $designation1 = $_GET["medicament1"];
                $designation2 = $_GET["medicament2"];
                if($designation1!=$designation2){
                $requette = "SELECT COUNT(*) AS compatibilite FROM compatibles
    -- avec cette ligne je cherche le refmed du medicament que j'ai rentrer et je regarde si il est dans la colonne refmed2 de la table compatibles
    WHERE (refmed1 IN (SELECT refmed FROM medicaments WHERE designation = '$designation1')
    -- je fais de meme ici  
    AND refmed2 IN (SELECT refmed FROM medicaments WHERE designation = '$designation2'))
    -- je verifie maintenant dans le sens inverse 
    OR (refmed1 IN (SELECT refmed FROM medicaments WHERE designation = '$designation2') 
    AND refmed2 IN (SELECT refmed FROM medicaments WHERE designation = '$designation1')) ";
                // j'execute ma requette
                $execute = mysqli_query($id, $requette);
                // je recupere le resultat 
                $ligne = mysqli_fetch_assoc($execute);
                if ($ligne['compatibilite'] > 0) {
                    echo "<p style='color:green'>Les médicaments sont compatibles.</p>";
                } else {
                    echo "<p style='color:red'>Les médicaments ne sont pas compatibles.</p>";
                }
            }else{
                echo "<p style='color:red'>Veuillez différencier les deux médicaments </p>";
            }
            }

            ?>
        </div>
    </form>
</body>

</html>