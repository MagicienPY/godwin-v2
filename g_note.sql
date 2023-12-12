-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 30 nov. 2023 à 10:21
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
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nom_classe` varchar(255) NOT NULL,
  `niveau_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom_classe`, `niveau_classe`) VALUES
(1, '1ère année', 1),
(2, '2ème année', 2),
(3, '3ème année', 3),
(4, '1ère année', 1),
(5, '2ème année', 2),
(6, '3ème année', 3),
(7, '4ème', 4);

-- --------------------------------------------------------

--
-- Structure de la table `cote`
--

CREATE TABLE `cote` (
  `id_cote` int(11) NOT NULL,
  `cote_cc` float NOT NULL,
  `cote_sn` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cote`
--

INSERT INTO `cote` (`id_cote`, `cote_cc`, `cote_sn`) VALUES
(1, 0.4, 0.6);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id_cours` int(11) NOT NULL,
  `nom_cours` varchar(255) NOT NULL,
  `code_cours` varchar(255) NOT NULL,
  `nb_credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `nom_cours`, `code_cours`, `nb_credits`) VALUES
(1, 'Mathématiques 1', 'M1', 3),
(2, 'Physique 1', 'P1', 3),
(3, 'Chimie 1', 'C1', 3),
(4, 'Informatique 1', 'I1', 3),
(5, 'Mathématiques 2', 'M2', 3),
(6, 'Physique 2', 'P2', 3),
(7, 'Chimie 2', 'C2', 3),
(8, 'Informatique 2', 'I2', 3),
(9, 'Mathématiques 1', 'M1', 3),
(10, 'Physique 1', 'P1', 3),
(11, 'Chimie 1', 'C1', 3),
(12, 'Informatique 1', 'I1', 3),
(13, 'Mathématiques 2', 'M2', 3),
(14, 'Physique 2', 'P2', 3),
(15, 'Chimie 2', 'C2', 3),
(16, 'Informatique 2', 'I2', 3),
(17, 'SYST INFO GEO', 'SIG2', 6);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_enseignant` int(11) NOT NULL,
  `nom_enseignant` varchar(255) NOT NULL,
  `prenom_enseignant` varchar(255) NOT NULL,
  `tel_enseignant` varchar(255) NOT NULL,
  `email_enseignant` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_enseignant`, `nom_enseignant`, `prenom_enseignant`, `tel_enseignant`, `email_enseignant`) VALUES
(1, 'Dupont', 'Jean', '0123456789', 'jean.dupont@example.com'),
(2, 'Durant', 'Pierre', '9876543210', 'pierre.durant@example.com'),
(3, 'Moreau', 'Marie', '1234567890', 'marie.moreau@example.com'),
(4, 'Lefebvre', 'Paul', '9876543210', 'paul.lefebvre@example.com'),
(5, 'Dupont', 'Jean', '0123456789', 'jean.dupont@example.com'),
(6, 'Durant', 'Pierre', '9876543210', 'pierre.durant@example.com'),
(7, 'Moreau', 'Marie', '1234567890', 'marie.moreau@example.com'),
(8, 'Lefebvre', 'Paul', '9876543210', 'paul.lefebvre@example.com'),
(9, 'Rousseau', 'Jacques', '1234567890', 'jacques.rousseau@example.com');

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
(6, '26522', '84225', '2023-11-01', 'iai-cam', 'yde', '691569975', 'mvondo', 'serge');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `nom_matiere` varchar(255) NOT NULL,
  `id_module` int(11) NOT NULL,
  `coef_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nom_matiere`, `id_module`, `coef_matiere`) VALUES
(1, 'Algèbre', 1, 4),
(2, 'Analyse', 1, 2),
(3, 'Géométrie', 1, 2),
(4, 'Mécanique', 2, 2),
(5, 'Électricité', 2, 2),
(6, 'Chimie générale', 3, 8),
(7, 'Chimie organique', 3, 2),
(8, 'Programmation', 4, 2),
(9, 'Réseaux', 4, 2),
(10, 'Algèbre', 1, 2),
(11, 'Analyse', 1, 2),
(12, 'Géométrie', 1, 2),
(13, 'Mécanique', 2, 2),
(14, 'Électricité', 2, 2),
(15, 'Chimie générale', 3, 2),
(16, 'Chimie organique', 3, 8),
(17, 'Programmation', 4, 2),
(18, 'Réseaux', 4, 2),
(19, 'SIG SYS INFO', 3, 4),
(20, 'dd', 3, 5),
(21, 'sdfjlk', 2, 5),
(22, '23', 2, 3),
(50, 'hacking', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id_module` int(11) NOT NULL,
  `nom_module` varchar(255) NOT NULL,
  `coef_module` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `nom_module`, `coef_module`) VALUES
(1, 'Mathématiques', 3),
(2, 'Physique', 2),
(3, 'Chimie', 2),
(4, 'Informatique', 3),
(5, 'Mathématiques', 3),
(6, 'Physique', 2),
(7, 'Chimie', 2),
(8, 'Informatique', 3),
(9, 'SIG', 6),
(10, 'SSIG 2', 1),
(12, 'SIG', 6),
(13, 'systeme d\'information geographique', 4),
(15, 'iot', 5),
(16, 'sigg 2', 5);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id_note` int(11) NOT NULL,
  `valeur_note` float NOT NULL,
  `type_note` varchar(255) NOT NULL,
  `annee_scolaire` varchar(255) NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `poids_note` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `note_cc` float NOT NULL,
  `note_sn` float NOT NULL,
  `id_cote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `valeur_note`, `type_note`, `annee_scolaire`, `semestre`, `poids_note`, `id_etudiant`, `id_matiere`, `id_enseignant`, `note_cc`, `note_sn`, `id_cote`) VALUES
(1, 13, 'examen', '2022-2023', 's1', 2, 1, 15, 4, 13, 10, 1),
(8, 15.6, 'examen', '2022-2023', 's1', 5, 1, 1, 4, 15.6, 18.4, 1),
(9, 15.6, 'examen', '2022-2023', 's2', 5, 1, 3, 4, 15.6, 18.4, 1),
(25, 12.5, 'examen', '2022-2023', 'S1', 2, 2, 1, 1, 15, 15, 1),
(26, 14, 'examen', '2022-2023', 'S1', 2, 3, 1, 1, 16, 14, 1),
(27, 16, 'examen', '2022-2023', 'S1', 6, 4, 1, 1, 19, 12, 1),
(28, 13, 'examen', '2022-2023', 'S1', 2, 5, 2, 2, 10, 11, 1),
(29, 15, 'examen', '2022-2023', 'S1', 2, 6, 2, 2, 13, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE `resultat` (
  `id_resultat` int(11) NOT NULL,
  `moyenne_resultat` float NOT NULL,
  `id_etudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nom_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom_role`) VALUES
(1, 'admin'),
(2, 'agent'),
(3, 'chef_dep');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `username`, `password`, `role_id`) VALUES
(1, 'John', 'Doe', '123456', 'motdepasse', 1),
(2, 'Jane', 'Smith', '654321', 'motdepasse', 1),
(3, 'John', 'Doe', '123456', 't', 1),
(4, 'Jane', 'Smith', '654321', 'motdepasse', 1),
(8, 'Dupont', 'Jean', 'DupontJean', 'motdepasse', 2),
(9, 'Durant', 'Pierre', 'DurantPierre', 'test', 2),
(10, 'Moreau', 'Marie', 'MoreauMarie', 'motdepasse', 2),
(11, 'Lefebvre', 'Paul', 'LefebvrePaul', 'motdepasse', 2),
(12, 'Dupont', 'Jean', 'DupontJean', 'motdepasse', 2),
(13, 'Durant', 'Pierre', 'DurantPierre', 'motdepasse', 2),
(14, 'Moreau', 'Marie', 'MoreauMarie', 'motdepasse', 2),
(15, 'Lefebvre', 'Paul', 'LefebvrePaul', 'motdepasse', 2),
(16, 'Rousseau', 'Jacques', 'RousseauJacques', 'motdepasse', 2),
(45, 'amombo', 'stephane', 'stephaneamombo', 'test', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Index pour la table `cote`
--
ALTER TABLE `cote`
  ADD PRIMARY KEY (`id_cote`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id_enseignant`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `unique_mat_etudiant` (`mat_etudiant`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`),
  ADD KEY `id_module` (`id_module`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_module`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_enseignant` (`id_enseignant`);

--
-- Index pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`id_resultat`),
  ADD KEY `id_etudiant` (`id_etudiant`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562327;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id_resultat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
