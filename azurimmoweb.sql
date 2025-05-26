-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 26 mai 2025 à 15:32
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `azurimmoweb`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE `appartement` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `surface` double NOT NULL,
  `nbre_pieces` int(11) NOT NULL,
  `batiment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `description`, `numero`, `surface`, `nbre_pieces`, `batiment_id`) VALUES
(1, 'Appartement de luxe', '05', 15, 2, 1),
(2, 'Appartement face a la mer', '56', 89, 6, 2),
(3, 'Appartement vue sur jardin', '85', 45, 4, 1),
(4, 'Appartement cosy', '999', 150, 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `adresse`, `ville`) VALUES
(1, '20 rue du four', 'Caen'),
(2, '15 rue de l\'avenir', 'Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `id` int(11) NOT NULL,
  `appartement_id` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  `date_sortie` date NOT NULL,
  `montant_loyer` double NOT NULL,
  `montant_charges` double NOT NULL,
  `statut` varchar(255) NOT NULL,
  `locataire_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `appartement_id`, `date_entree`, `date_sortie`, `montant_loyer`, `montant_charges`, `statut`, `locataire_id`) VALUES
(1, 1, '2025-05-02', '2029-02-23', 800, 151, 'En cours', NULL),
(2, 1, '2016-01-19', '2021-07-15', 689.36, 158.45, 'Terminé', NULL),
(3, 2, '2005-03-01', '2035-12-16', 500, 112.43, 'En cours', NULL),
(4, 2, '2019-05-24', '2021-03-10', 524.7, 129.75, 'Terminé', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250325100042', '2025-03-25 11:00:54', 28),
('DoctrineMigrations\\Version20250325103535', '2025-03-25 11:35:44', 8),
('DoctrineMigrations\\Version20250325103751', '2025-03-25 11:37:57', 44),
('DoctrineMigrations\\Version20250327101233', '2025-03-27 11:12:43', 11),
('DoctrineMigrations\\Version20250327102016', '2025-03-27 11:20:23', 54),
('DoctrineMigrations\\Version20250425062547', '2025-04-25 08:25:53', 28),
('DoctrineMigrations\\Version20250513084048', '2025-05-13 10:40:53', 56),
('DoctrineMigrations\\Version20250526094750', '2025-05-26 11:47:57', 13),
('DoctrineMigrations\\Version20250526123041', '2025-05-26 14:30:48', 11),
('DoctrineMigrations\\Version20250526123147', '2025-05-26 14:31:54', 65);

-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

CREATE TABLE `locataire` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_n` date NOT NULL,
  `lieu_n` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locataire`
--

INSERT INTO `locataire` (`id`, `nom`, `prenom`, `date_n`, `lieu_n`) VALUES
(1, 'Dupont', 'Louis', '1976-08-21', 'Nice'),
(2, 'Paradis', 'André', '1957-03-15', 'Antibes');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(5, 'locataire@azurimmo.fr', '[\"ROLE_LOCATAIRE\"]', '$2y$13$SMat455aroydAAZKLjiZyeHjbBoVB0gSmY1tQB20uLWAqcm5EhJ/K'),
(6, 'associe@azurimmo.fr', '[\"ROLE_ASSOCIE\"]', '$2y$13$UUKhFpRRUNteQyt9/eFQx.nUv8gulpBxDZXVdHyIWnaP1GXmvfuL6'),
(7, 'admin@azurimmo.fr', '[\"ROLE_ADMIN\"]', '$2y$13$sE6JV3DMABQtSlrOv5pooeQ31Kj22quoTzpYJjbLUbfhyJD.XRZrG');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_71A6BD8DD6F6891B` (`batiment_id`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_60349993E1729BBA` (`appartement_id`),
  ADD KEY `IDX_60349993D8A38199` (`locataire_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `locataire`
--
ALTER TABLE `locataire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartement`
--
ALTER TABLE `appartement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `locataire`
--
ALTER TABLE `locataire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `FK_71A6BD8DD6F6891B` FOREIGN KEY (`batiment_id`) REFERENCES `batiment` (`id`);

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FK_60349993D8A38199` FOREIGN KEY (`locataire_id`) REFERENCES `locataire` (`id`),
  ADD CONSTRAINT `FK_60349993E1729BBA` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
