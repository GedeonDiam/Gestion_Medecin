-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 mars 2024 à 08:48
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
create database hopital;
use hopital;

-- --------------------------------------------------------

--


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hopital`
--

-- --------------------------------------------------------

--
-- Structure de la table `alternants`
--

DROP TABLE IF EXISTS `alternants`;
CREATE TABLE IF NOT EXISTS `alternants` (
  `idAlt` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`idAlt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `analyses`
--

DROP TABLE IF EXISTS `analyses`;
CREATE TABLE IF NOT EXISTS `analyses` (
  `numanl` int NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `laboratoire` int DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`numanl`),
  KEY `laboratoire` (`laboratoire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `analyses`
--

INSERT INTO `analyses` (`numanl`, `designation`, `laboratoire`, `prix`) VALUES
(1, 'radio', 2, 60),
(2, 'scanner', 2, 120),
(3, 'scintigraphie', 3, 60),
(4, 'ecographie', 4, 50),
(5, 'numeration globulaire', 1, 15),
(6, 'd?tection virus', 1, 20),
(7, 'hormones', 1, 30),
(8, 'cholesterol', 1, 16),
(9, '?lectro-cardiogramme', 5, 100),
(10, 'contr?le', 6, 60.5);

-- --------------------------------------------------------

--
-- Structure de la table `compatibles`
--

DROP TABLE IF EXISTS `compatibles`;
CREATE TABLE IF NOT EXISTS `compatibles` (
  `refmed1` int NOT NULL DEFAULT '0',
  `refmed2` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`refmed1`,`refmed2`),
  KEY `id_comp_med2` (`refmed2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compatibles`
--

INSERT INTO `compatibles` (`refmed1`, `refmed2`) VALUES
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(4, 3),
(1, 4),
(2, 4),
(3, 4),
(6, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `connexions`
--

DROP TABLE IF EXISTS `connexions`;
CREATE TABLE IF NOT EXISTS `connexions` (
  `idc` int NOT NULL AUTO_INCREMENT,
  `num_sessions` varchar(255) NOT NULL,
  `login` varchar(50) NOT NULL,
  `dateDeb` datetime NOT NULL,
  `dateFin` datetime DEFAULT NULL,
  PRIMARY KEY (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `connexions`
--

INSERT INTO `connexions` (`idc`, `num_sessions`, `login`, `dateDeb`, `dateFin`) VALUES
(1, '0', 'prof', '2021-01-13 11:46:14', '2021-01-13 12:01:46'),
(2, '0', 'prof', '2021-01-13 11:46:44', '2021-01-13 12:01:46'),
(3, '0', 'toto', '2021-01-13 11:48:54', '2021-01-13 11:49:14'),
(4, '0', 'prof', '2021-01-13 11:55:10', '2021-01-13 12:01:46'),
(5, '0', 'prof', '2021-01-13 11:55:51', '2021-01-13 12:01:46'),
(6, '0', 'prof', '2021-01-13 12:01:05', '2021-01-13 12:01:46'),
(7, '0', 'toto', '2021-01-13 12:03:18', '2021-01-13 12:19:21'),
(8, 'smeb0mn81sjp45pqqqrd53ahp0', 'eleve', '2026-02-24 03:01:35', '2026-02-24 03:06:55'),
(9, 'smeb0mn81sjp45pqqqrd53ahp0', 'eleve', '2026-02-24 03:37:12', NULL),
(10, 'addb2h55s1bm8j9u5lf4aqc7cv', 'Efrei', '2015-03-24 08:38:56', NULL),
(11, '72ls50k2n7pue31jn30ec6kgu8', 'hamid', '2024-03-15 10:46:23', NULL),
(12, '72ls50k2n7pue31jn30ec6kgu8', 'hamid', '2024-03-15 10:48:16', NULL),
(13, '72ls50k2n7pue31jn30ec6kgu8', 'hamid', '2024-03-15 14:01:26', NULL),
(14, '77c1qtd4j6c0oc7jtk19buursi', 'hamid', '2024-03-19 15:14:08', NULL),
(15, 'jp5i034mhebgq2jtja4dotg522', 'hamid', '2024-03-25 09:37:15', NULL),
(16, 'jp5i034mhebgq2jtja4dotg522', 'hamid', '2024-03-25 09:38:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `laboratoires`
--

DROP TABLE IF EXISTS `laboratoires`;
CREATE TABLE IF NOT EXISTS `laboratoires` (
  `numlab` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numlab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `laboratoires`
--

INSERT INTO `laboratoires` (`numlab`, `nom`) VALUES
(1, 'analyses sanguines'),
(2, 'radiologie'),
(3, 'scintigraphie'),
(4, 'echographie'),
(5, '?lectro-cardiologie'),
(6, 'm?decine g?n?rale');

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

DROP TABLE IF EXISTS `medecins`;
CREATE TABLE IF NOT EXISTS `medecins` (
  `numed` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `specialite` varchar(50) DEFAULT NULL,
  `service` int DEFAULT NULL,
  PRIMARY KEY (`numed`),
  KEY `service` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`numed`, `nom`, `prenom`, `specialite`, `service`) VALUES
(1, 'DUPONT', 'Stephane', 'cardiologue', 1),
(3, 'CONTES', 'HONORES', 'chirurgien', 4),
(6, 'PENET', 'LOUISE', 'urgentiste', 2),
(7, 'DELCOURT', 'FLORENCE', 'cancerologue', 3),
(8, 'CASPER', 'ARMAND', 'urgentiste', 3),
(10, 'DECLERC', 'HENRI', 'chirurgien', 4),
(12, 'WILLIAMS', 'GEORGE', 'cardiologue', 1),
(14, 'VANASTEN', 'ROBERT', 'radiologue', 1),
(16, 'SCHMIDT', 'ANDRE', 'hematologue', 3),
(17, 'MARTIN', 'ALAIN', 'chirurgien', 3),
(18, 'JACQUES', 'ERIC', 'cancerologue', 5),
(19, 'LUCAS', 'ANNIE', 'cardiologue', 1),
(20, 'THERY', 'GERARD', 'chirurgien', 4),
(21, 'WOLNIEWICZ', 'IRENA', 'cancerologue', 1),
(123, 'ROUSSEAU', 'Romuald', 'chirurgien', NULL),
(124, 'ROUSSEAU', 'Romuald', 'chirurgien', NULL),
(152, 'LEMARCHAL', 'Chieaux', 'radiologue', NULL),
(154, 'Dominic', 'POPO', 'chirurgien', 3),
(155, 'Dominique', 'POPi', 'chirurgien', NULL),
(162, 'okay', 'okayu', 'hematologue', NULL),
(163, 'lLEMAR', 'Golbert', 'chirurgien', 5),
(165, 'POLAGBE', 'Aristote', 'hematologue', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `medicaments`
--

DROP TABLE IF EXISTS `medicaments`;
CREATE TABLE IF NOT EXISTS `medicaments` (
  `refmed` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) DEFAULT NULL,
  `laboratoire` varchar(30) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`refmed`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medicaments`
--

INSERT INTO `medicaments` (`refmed`, `designation`, `laboratoire`, `prix`) VALUES
(1, 'aspirine', 'Ouille', 5),
(2, 'sparadrap', 'Ouille', 2.5),
(3, 'xanax', 'Ducalme', 10),
(4, 'maxiton', 'Ducalme', 8),
(5, 'arsenic', 'Radical', 10),
(6, 'cyanure', 'Radical', 8),
(7, 'jus de carotte bio', 'Choux rave', 20),
(8, 'Arnican', 'Dell', 15.35);

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `numpat` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  PRIMARY KEY (`numpat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`numpat`, `nom`, `prenom`, `ville`, `sexe`) VALUES
(1, 'MOUGIN', 'PIERRE', 'DOUAI', 'M'),
(2, 'PIERRARD', 'ROGER', 'DOUAI', 'M'),
(3, 'TRENTA', 'ADELINE', 'TOURCOING', 'F'),
(4, 'MOSKOWITCH', 'MICHEL', 'MARCQ EN BAROEUL', 'M'),
(5, 'DELAPORTE', 'STEPHANE', 'LA MADELEINE', 'M'),
(6, 'AMBERT', 'SOPHIE', 'ARRAS', 'F'),
(7, 'ZATOPEK', 'ANDRE', 'LAMBERSART', 'M'),
(8, 'AYMARD', 'RENE', 'LILLE', 'M'),
(9, 'BENABAR', 'JEAN-PIERRE', 'ARRAS', 'M'),
(10, 'PERROCHON', 'MARC', 'ROUBAIX', 'M'),
(11, 'BONIFACE', 'JEAN', 'DOUAI', 'M'),
(12, 'MOUNIER', 'ANNE-MARIE', 'ARRAS', 'F'),
(13, 'PERCEVAL', 'GAEL', 'ROUBAIX', 'M'),
(14, 'SAUNIERE', 'CHARLES', 'DOUAI', 'M'),
(15, 'CAPITANO', 'ANGELO', 'TOURCOING', 'M'),
(16, 'BUGARACH', 'JEAN-MARC', 'LILLE', 'M'),
(17, 'VALMIGERE', 'PIERRE', 'MARCQ EN BAROEUL', 'M'),
(18, 'SOUBEYRAN', 'ANNE-SOPHIE', 'ARRAS', 'F'),
(19, 'DUPUIS', 'PIERRE-ANDRE', 'MARCQ EN BAROEUL', 'M'),
(20, 'MARTIN', 'ANNE-SOPHIE', 'ROUBAIX', 'F'),
(21, 'BUFFIERE', 'PIERRE', 'LAMBERSART', 'M'),
(22, 'LECHAT', 'EMMANUEL', 'LA MADELEINE', 'M'),
(23, 'LACROIX', 'DANIEL', 'LILLE', 'M'),
(24, 'POIMULLE', 'JEAN-CLAUDE', 'HEM', 'M'),
(25, 'GOMBERT', 'MARCEL', 'ROUBAIX', 'M'),
(26, 'LABRICOLE', 'ADRIEN', 'LILLE', 'M'),
(27, 'DESSERPRIX', 'JEAN-PIERRE', 'LILLE', 'M'),
(28, 'JURANSSON', 'CATHERINE', 'MARCQ EN BAROEUL', 'F'),
(29, 'KERMORAL', 'ANNE', 'LAMBERSART', 'F'),
(30, 'STUPP', 'KARL', 'LA MADELEINE', 'M'),
(31, 'GOEDEL', 'THEOPHILE', 'LILLE', 'M'),
(32, 'BRICOUT', 'JULES', 'ROUBAIX', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
CREATE TABLE IF NOT EXISTS `realiser` (
  `numrealise` int NOT NULL,
  `numpat` int DEFAULT NULL,
  `numed` int DEFAULT NULL,
  `numanl` int DEFAULT NULL,
  `numres` int DEFAULT NULL,
  `date_analyse` char(10) DEFAULT NULL,
  PRIMARY KEY (`numrealise`),
  KEY `numpat` (`numpat`),
  KEY `id_realiser_medecin` (`numed`),
  KEY `id_realiser_analyse` (`numanl`),
  KEY `id_realiser_resultat` (`numres`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `realiser`
--

INSERT INTO `realiser` (`numrealise`, `numpat`, `numed`, `numanl`, `numres`, `date_analyse`) VALUES
(1, 1, 19, 9, 1, '16/10/2006'),
(2, 1, 19, 10, 2, '17/10/2006'),
(3, 5, 17, 5, 3, '10/10/2006'),
(4, 5, 17, 10, 4, '11/10/2006'),
(5, 1, NULL, 9, 5, '22/10/2006'),
(6, 1, 19, 2, 6, '22/10/2006'),
(7, 1, 12, 4, 7, '23/10/2006'),
(8, 1, 19, 10, 8, '24/10/2006'),
(9, 17, NULL, NULL, 9, '16/10/2006'),
(10, 26, 20, 1, 10, '18/10/2006'),
(11, 28, 17, 5, 11, '20/10/2006'),
(12, 32, NULL, 1, 12, '25/10/2006'),
(13, 13, NULL, 2, 13, '22/10/2006'),
(14, 13, 20, 5, 14, '23/10/2006'),
(15, 25, 8, 6, 15, '28/10/2006'),
(16, 25, 8, 8, 16, '29/10/2006'),
(17, 16, 10, 10, 17, '30/10/2006'),
(18, 16, 10, 10, 18, '01/11/2006'),
(19, 18, NULL, 6, 19, '05/11/2006');

-- --------------------------------------------------------

--
-- Structure de la table `resultats`
--

DROP TABLE IF EXISTS `resultats`;
CREATE TABLE IF NOT EXISTS `resultats` (
  `numres` int NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`numres`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `resultats`
--

INSERT INTO `resultats` (`numres`, `libelle`) VALUES
(1, 'pas terrible'),
(2, 'bof'),
(3, 'on ne voit rien'),
(4, 'sans espoir'),
(5, 'doit ?tre malade'),
(6, 'peut mieux faire'),
(7, 'encore un effort s\'il veut gu?rir'),
(8, 'patraque'),
(9, 'sa rate se dilate'),
(10, 'lui demander si ?a va. Si oui, alors OK, sinon ...'),
(11, 'on dira que ?a ira'),
(12, 'se plaint sans raison'),
(13, 'c\'est un cas !'),
(14, 'les analyses s\'infirment les unes les autres'),
(15, 'peut-?tre que oui, et peut-?tre que non'),
(16, 'guerira s\'il survit aux traitements'),
(17, 'y a t-il un docteur dans le service ?'),
(18, 'm\'ouai'),
(19, '?a doit faire mal');

-- --------------------------------------------------------

--
-- Structure de la table `sejours`
--

DROP TABLE IF EXISTS `sejours`;
CREATE TABLE IF NOT EXISTS `sejours` (
  `numsejour` int NOT NULL,
  `numpat` int DEFAULT NULL,
  `numserv` int DEFAULT NULL,
  `entree` char(10) DEFAULT NULL,
  `sortie` char(10) DEFAULT NULL,
  PRIMARY KEY (`numsejour`),
  KEY `id_sejour_patient` (`numpat`),
  KEY `id_sejour_service` (`numserv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sejours`
--

INSERT INTO `sejours` (`numsejour`, `numpat`, `numserv`, `entree`, `sortie`) VALUES
(1, 1, 1, '15/10/2006', '18/10/2006'),
(2, 5, 3, '07/10/2006', '12/11/2006'),
(3, 1, 2, '22/10/2006', '25/10/2006'),
(4, 13, 4, '20/10/2006', '25/10/2006'),
(5, 25, 2, '28/10/2006', '29/10/2006'),
(6, 16, 4, '29/10/2006', '02/11/2006');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `numserv` int NOT NULL,
  `nomserv` varchar(30) DEFAULT NULL,
  `chef` int DEFAULT NULL,
  PRIMARY KEY (`numserv`),
  KEY `id_service_medecin` (`chef`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`numserv`, `nomserv`, `chef`) VALUES
(1, 'Cardiologie', 1),
(2, 'Urgences', 21),
(3, 'Maladies infectieuses', 16),
(4, 'Chirurgie', 7),
(5, 'Immunologie', 3);

-- --------------------------------------------------------

--
-- Structure de la table `soins`
--

DROP TABLE IF EXISTS `soins`;
CREATE TABLE IF NOT EXISTS `soins` (
  `numsoin` int NOT NULL,
  `numpat` int DEFAULT NULL,
  `numed` int DEFAULT NULL,
  `refmed` int DEFAULT NULL,
  `date_soin` char(10) DEFAULT NULL,
  PRIMARY KEY (`numsoin`),
  KEY `id_soin_patient` (`numpat`),
  KEY `id_soin_medecin` (`numed`),
  KEY `id_soin_medicament` (`refmed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `soins`
--

INSERT INTO `soins` (`numsoin`, `numpat`, `numed`, `refmed`, `date_soin`) VALUES
(1, 1, 19, 1, '15/10/2006'),
(2, 1, 19, 3, '16/10/2006'),
(3, 1, 19, 7, '16/10/2006'),
(4, 1, 19, 1, '17/10/2006'),
(5, 5, 17, 1, '07/10/2006'),
(6, 5, 17, 3, '08/10/2006'),
(7, 1, NULL, 4, '22/10/2006'),
(8, 1, 19, 1, '23/10/2006'),
(9, 1, 12, 3, '23/10/2006'),
(10, 1, 19, 2, '24/10/2006'),
(11, 17, NULL, 1, '16/10/2006'),
(12, 26, 20, 1, '18/10/2006'),
(13, 28, 17, 2, '20/10/2006'),
(14, 32, NULL, 1, '25/10/2006'),
(15, 13, NULL, 1, '21/10/2006'),
(16, 13, NULL, 2, '24/10/2006'),
(17, 13, 20, 3, '24/10/2006'),
(18, 25, 8, 7, '28/10/2006'),
(19, 25, 8, 5, '29/10/2006'),
(20, 25, 8, 6, '29/10/2006'),
(21, 16, 10, 7, '30/10/2006'),
(22, 16, 10, 1, '30/10/2006'),
(23, 18, NULL, 1, '01/11/2006'),
(24, 18, NULL, 4, '01/11/2006'),
(25, 18, NULL, 7, '01/11/2006');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `login` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `niveau` int DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`login`, `mdp`, `niveau`, `nom`, `prenom`, `email`) VALUES
('Efrei', 'efrei', 1, 'Perceau', 'Paul', 'perceau@gmail.com'),
('eleve', 'eleve', 1, 'Leroy', 'Elsa', 'leroy@hotmail.com'),
('faiz', 'faiz', NULL, 'faiz', 'faiz', 'faiz@gmail.com'),
('hamid', 'hamid', 2, 'hamid', 'hamid', 'hamid@gmail.com'),
('nikmokn', 'faresfaresfarese', NULL, 'fares11.slimani@gmail.com', 'fares', 'fares11.slimnaia@gmail'),
('prof', 'prof', 2, 'Guez', 'Fred', 'fredguez@gmail.com'),
('toto', 'toto', 1, 'Dupont', 'Eric', 'dupont@gmail.com');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `analyses`
--
ALTER TABLE `analyses`
  ADD CONSTRAINT `id_analyse_laboratoire` FOREIGN KEY (`laboratoire`) REFERENCES `laboratoires` (`numlab`);

--
-- Contraintes pour la table `compatibles`
--
ALTER TABLE `compatibles`
  ADD CONSTRAINT `id_comp_med1` FOREIGN KEY (`refmed1`) REFERENCES `medicaments` (`refmed`),
  ADD CONSTRAINT `id_comp_med2` FOREIGN KEY (`refmed2`) REFERENCES `medicaments` (`refmed`);

--
-- Contraintes pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD CONSTRAINT `id_medecin_service` FOREIGN KEY (`service`) REFERENCES `services` (`numserv`);

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `id_realiser_analyse` FOREIGN KEY (`numanl`) REFERENCES `analyses` (`numanl`),
  ADD CONSTRAINT `id_realiser_medecin` FOREIGN KEY (`numed`) REFERENCES `medecins` (`numed`),
  ADD CONSTRAINT `id_realiser_patient` FOREIGN KEY (`numpat`) REFERENCES `patients` (`numpat`),
  ADD CONSTRAINT `id_realiser_resultat` FOREIGN KEY (`numres`) REFERENCES `resultats` (`numres`);

--
-- Contraintes pour la table `sejours`
--
ALTER TABLE `sejours`
  ADD CONSTRAINT `id_sejour_patient` FOREIGN KEY (`numpat`) REFERENCES `patients` (`numpat`),
  ADD CONSTRAINT `id_sejour_service` FOREIGN KEY (`numserv`) REFERENCES `services` (`numserv`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `id_service_medecin` FOREIGN KEY (`chef`) REFERENCES `medecins` (`numed`);

--
-- Contraintes pour la table `soins`
--
ALTER TABLE `soins`
  ADD CONSTRAINT `id_soin_medecin` FOREIGN KEY (`numed`) REFERENCES `medecins` (`numed`),
  ADD CONSTRAINT `id_soin_medicament` FOREIGN KEY (`refmed`) REFERENCES `medicaments` (`refmed`),
  ADD CONSTRAINT `id_soin_patient` FOREIGN KEY (`numpat`) REFERENCES `patients` (`numpat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
