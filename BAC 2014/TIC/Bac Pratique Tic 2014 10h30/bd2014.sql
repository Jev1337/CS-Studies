-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Mardi 11 Mai 2021 à 14:41
-- Version du serveur: 5.0.27
-- Version de PHP: 5.2.0
-- 
-- Base de données: `bd2014`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `abonne`
-- 

CREATE TABLE `abonne` (
  `Cin` varchar(8) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY  (`Cin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `abonne`
-- 

INSERT INTO `abonne` (`Cin`, `Nom`, `Prenom`, `Adresse`, `Email`) VALUES 
('04545459', 'Belgacem', 'Nadia', 'Nabeul', 'Nadia@gmail.com'),
('12323237', 'Rahmani', 'Bechir', 'Tozeur', 'Bechir@hotmail.com'),
('13636368', 'Channoufi', 'Rym', 'Hammam Chatt', 'Rym105@yahoo.fr');

-- --------------------------------------------------------

-- 
-- Structure de la table `abonnement`
-- 

CREATE TABLE `abonnement` (
  `Cin` varchar(8) NOT NULL,
  `Code` varchar(5) NOT NULL,
  `DateAbon` date NOT NULL,
  `DateEch` date NOT NULL,
  PRIMARY KEY  (`Cin`,`Code`,`DateAbon`),
  KEY `Cin` (`Cin`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `abonnement`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `revue`
-- 

CREATE TABLE `revue` (
  `Code` varchar(5) NOT NULL,
  `Titre` varchar(20) NOT NULL,
  `PrixMens` decimal(5,3) NOT NULL,
  PRIMARY KEY  (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `revue`
-- 

INSERT INTO `revue` (`Code`, `Titre`, `PrixMens`) VALUES 
('Inf12', 'Java pour debutants', 12.250),
('Lit13', 'Mots fleches', 1.250),
('Sci04', 'Sciences et vie', 8.540),
('Spt01', 'Le meilleur du foot', 5.200);

-- 
-- Contraintes pour les tables exportées
-- 

-- 
-- Contraintes pour la table `abonnement`
-- 
ALTER TABLE `abonnement`
  ADD CONSTRAINT `abonnement_ibfk_2` FOREIGN KEY (`Code`) REFERENCES `revue` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `abonnement_ibfk_1` FOREIGN KEY (`Cin`) REFERENCES `abonne` (`Cin`) ON DELETE CASCADE ON UPDATE CASCADE;
