-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 21 avr. 2021 à 17:38
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd1337`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `DateEval` date NOT NULL,
  `IdHotel` int(11) NOT NULL,
  `NoteAccueil` int(11) NOT NULL,
  `NoteRest` int(11) NOT NULL,
  `NoteExtra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`DateEval`, `IdHotel`, `NoteAccueil`, `NoteRest`, `NoteExtra`) VALUES
('2017-05-22', 10, 3, 1, 0),
('2017-06-15', 20, 3, 2, 2),
('2017-06-15', 30, 2, 1, 2),
('2018-02-20', 10, 2, 1, 1),
('2018-04-13', 30, 2, 2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `IdHotel` int(11) NOT NULL,
  `NomHotel` varchar(50) NOT NULL,
  `TelHotel` varchar(8) NOT NULL,
  `VilleHotel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`IdHotel`, `NomHotel`, `TelHotel`, `VilleHotel`) VALUES
(10, '5 Stars', '76333444', 'Tozeur'),
(20, 'Globe', '78111111', 'Tabarka'),
(30, 'The Sun', '73888888', 'Monastir');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`DateEval`,`IdHotel`),
  ADD KEY `IdHotel` (`IdHotel`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`IdHotel`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`IdHotel`) REFERENCES `hotel` (`IdHotel`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
