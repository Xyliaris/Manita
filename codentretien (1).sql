-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 23 fév. 2018 à 14:18
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `codentretien`
--

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `idGroup` int(11) NOT NULL AUTO_INCREMENT,
  `labelGroup` varchar(32) NOT NULL,
  PRIMARY KEY (`idGroup`),
  UNIQUE KEY `idGroup` (`idGroup`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`idGroup`, `labelGroup`) VALUES
(1, 'Administrateur'),
(2, 'admin'),
(3, 'Professeur1');

-- --------------------------------------------------------

--
-- Structure de la table `map_permissions`
--

DROP TABLE IF EXISTS `map_permissions`;
CREATE TABLE IF NOT EXISTS `map_permissions` (
  `idGroup` int(11) NOT NULL,
  `idPermission` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `map_permissions`
--

INSERT INTO `map_permissions` (`idGroup`, `idPermission`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 101),
(3, 101),
(3, 3),
(2, 101),
(2, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `idPermission` int(11) NOT NULL AUTO_INCREMENT,
  `labelPermission` varchar(32) NOT NULL,
  PRIMARY KEY (`idPermission`),
  UNIQUE KEY `idPermission` (`idPermission`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`idPermission`, `labelPermission`) VALUES
(1, 'Panneau d\'administration'),
(2, 'Gestion des permissions'),
(3, 'troisieme permission'),
(4, 'Administration'),
(101, 'Faire une demande');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_label` varchar(30) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`room_id`, `room_label`) VALUES
(1, 'C115'),
(2, 'C200'),
(3, 'C400'),
(4, 'C564');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL,
  `status_label` varchar(32) NOT NULL,
  UNIQUE KEY `status_id` (`status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`status_id`, `status_label`) VALUES
(0, 'Nouveau'),
(1, 'Accepté'),
(2, 'Refusé'),
(3, 'Non traité'),
(4, 'Non définit');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_creation` date NOT NULL,
  `ticket_editDate` date NOT NULL,
  `ticket_description` longtext NOT NULL,
  `ticket_title` varchar(50) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `ticket_eventDate` date NOT NULL,
  `ticket_option` int(11) NOT NULL,
  `ticket_disposition` int(11) NOT NULL,
  `ticket_type` int(11) NOT NULL,
  `ticket_isAccepted` tinyint(1) NOT NULL,
  `ticket_deniedReason` varchar(256) CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `ticket_creation`, `ticket_editDate`, `ticket_description`, `ticket_title`, `room_id`, `user_id`, `status_id`, `ticket_eventDate`, `ticket_option`, `ticket_disposition`, `ticket_type`, `ticket_isAccepted`, `ticket_deniedReason`) VALUES
(18, '2018-02-22', '2018-02-22', 'A changer !', 'Dysfonctionnement haut-parleur', 2, 1, 2, '0000-00-00', 0, 0, 0, 0, 'Pas d\'argent'),
(17, '2018-02-22', '2018-02-22', 'L\'haut-parleur de ma salle de cours ne fonctionne pas, pourrais-je en avoir un nouveau ?', 'Dysfonctionnement haut-parleur', 1, 24, 1, '0000-00-00', 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(32) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_idGroup` int(11) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_gender` int(11) NOT NULL,
  `user_numberPhone` varchar(20) NOT NULL,
  `user_firstName` varchar(50) NOT NULL,
  `user_lastName` varchar(50) NOT NULL,
  `user_createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`, `user_idGroup`, `user_email`, `user_birthday`, `user_gender`, `user_numberPhone`, `user_firstName`, `user_lastName`, `user_createdOn`) VALUES
(1, 'admin', 'admin', 1, 'nicolas6720@gmail.com', '1997-06-13', 1, '0687916339', 'Tayfun', 'YILMAZ', '2018-02-12 11:04:47'),
(24, 'Xyliaris', '44553272', 100, 'xyliaris@gmail.com', '2018-02-14', 1, '0666666666', 'Xyl', 'Iaris', '2018-02-19 12:29:00'),
(25, 'nicolas', '123456', 1, 'bjrsltcav@gmail.com', '1999-04-22', 1, '0666666666', 'Nicolas', 'KLEIN', '2018-02-22 13:22:35'),
(26, 'tayfun', '123456', 3, 'bjrsltcav@gmail.com', '2000-02-25', 1, '06666666666', 'tayfun', 'yilmaz', '2018-02-22 13:29:08');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
