<?php
// j'ouvre aussi la session ici
session_start();
// si je le login de la session n'exite pas je ne pourrais pas entrer dans la page ListeMedecin.php
if (!isset($_SESSION["login"])) {
    header("location:connexion.php?=Veuillez_vous_connecter");
}
// je me connecte a la base de données avec la page connect.php
include "connect.php";
// je lance une requette
// calculer le nombre de medecins 
$countMedecins = mysqli_query($id, "SELECT COUNT(*) AS nbrMedecins FROM medecins; ");
if ($countMedecins) {
    $nbrMedecins = mysqli_fetch_assoc($countMedecins)['nbrMedecins'];
}
$limit = 10;
//   ceil perlet d'arrondir au dixieme 
$pages = ceil($nbrMedecins / $limit);
$currentPage = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($currentPage - 1) * $limit;
if (isset($_GET["search"])) {
    $nom = $_GET["nom"];
    $specialite = $_GET["specialite"];
    $requette = "select * from medecins  where nom like '%$nom%'and specialite like '%$specialite%' order by nom limit $offset,$limit";
} else {
    $requette = "select * from medecins order by nom limit $offset,$limit";
}
// j'execute ma requette
$execute = mysqli_query($id, $requette);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listes des medecins de l'hopital</title>
    <link rel="stylesheet" href="ListeMedecin.css">
</head>

<body>
    <form action="" method="get" style="text-align: center;">
        <div>
            <label for="">Nom du medecin</label>
            <input type="text" name="nom" id=""><br><br>
            <label for="">Specialité du medecin</label>
            <input type="text" name="specialite" id=""><br><br>
            <button type="submit" name="search">Rechercher</button>
        </div>
    </form>
    <h1>Listes des médécins de l'hopital <br> <a href="AjoutMedecin.php">Ajouter un nouveau Médécin</a> <br> <a href='deconnexion.php'>Déconnectez-vous</a><br><a href='ListConnexion.php'>ListConnexion.php</a><br><a href='ListePatients.php'>ListePatients.php</a><br><a href='ListeMedicaments.php'>listeMedicaments.php</a><br><a href='testcompatibilite.php'>testcompatibilité.php</a></h1>
    <table>
        <tr>
            <th>#</th>
            <th>NOM</th>
            <th>PRENOM</th>
            <th>SPECIALITE</th>
            <th>SERVICE</th>
            <th><img src="modif.png" alt="modifier" width="20px"></th>
            <th><img src="sup.png" alt="Supprimer" width="20px"></th>
        </tr>
        <!-- Afficher les resulyats de chaque colonne avec la boucle while(tant qu'on peut recupérer une ligne qu'il m'affiche le résultat) -->
        <?php
        while ($ligne = mysqli_fetch_assoc($execute)) {
            // je recupere le numéro du medecin sur lequel je clique pour supprimer dans la base de données
            $numed = $ligne["numed"];
            echo " <tr><td>$ligne[numed]</td><td>$ligne[nom]</td><td>$ligne[prenom]</td><td>$ligne[specialite]</td><td>$ligne[service]</td><td><a href='modifier.php?identifiant=$numed'><img src='modif.png' alt='modifier' width='15px'></a></td><td><a href='supprimer.php?identifiant=$numed'><img src='sup.png' alt='Supprimer' width='15px'></a></td></tr>";
        }
        ?>

    </table>
    <div class="pagination" style="text-align: center;">
        <?php
        $pageSuivante = $currentPage + 1;
        $pagePrecedente = $currentPage - 1;
        if ($currentPage < 1) : ?>
            <a href="?page=1">
                <<< /a>
                    <a href="?page=<?php echo  $pagePrecedente ?>">
                        << /a>
                        <?php endif; ?>
                        <?php
                        for ($i = 1; $i <= $pages; $i++) {
                            if ($i == $currentPage) {
                                echo "<a style='color:red' href='?page=$i'>$i<a/>";
                            } else {
                                echo "<a href='?page=$i'>$i<a/>";
                            }
                        }
                        ?>
                        <?php if ($currentPage < $pages) : ?>
                            <a href="?page=<?php echo $pageSuivante ?>">></a>
                            <a href="?page=<?php echo $pages ?>">>></a>
                        <?php endif ?>
    </div>

</body>

<div class="."></div>
</html>