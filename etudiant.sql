-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 05 déc. 2023 à 22:51
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `g_note`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `mat_etudiant` varchar(255) NOT NULL,
  `cin_etudiant` varchar(255) NOT NULL,
  `daten_etu` date NOT NULL,
  `lieun_etu` varchar(255) NOT NULL,
  `adress_etu` varchar(255) NOT NULL,
  `tel_etu` varchar(255) NOT NULL,
  `nom_etu` varchar(255) NOT NULL,
  `prenom_etu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `mat_etudiant`, `cin_etudiant`, `daten_etu`, `lieun_etu`, `adress_etu`, `tel_etu`, `nom_etu`, `prenom_etu`) VALUES
(1, '123456', '123456789', '1990-01-01', 'cameroun', 'awaie', '0123456789', 'mbarga', 'simeon'),
(2, '654321', '987654321', '1991-02-02', 'cameroun', 'a Liberté', '9876543210', 'amombo', 'stephane'),
(3, '123457', '123456789', '1990-01-01', 'cameroun', 'Rue de la République', '0123456789', 'ngongo', 'stephane'),
(4, '65432', '987654321', '1991-02-02', 'cameroun', 'la Liberté', '9876543210', 'ndzouanke', 'stephanne'),
(5, '20255', '20551', '2023-11-30', 'iai-cam', 'yde', '691569975', 'amougou', 'steve'),
(6, '26522', '84225', '2023-11-01', 'iai-cam', 'yde', '691569975', 'mvondo', 'serge'),
(7, '9615', '96151', '2001-11-25', 'iai-cam', 'yde', '691569976', 'evoung', 'freyd'),
(8, '25', '256', '2001-10-06', 'iai', 'yde', '6955', 'pi', 'carre');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `unique_mat_etudiant` (`mat_etudiant`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562327;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
