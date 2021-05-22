-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Mercredi 19 Mai 2021 à 22:24
-- Version du serveur: 5.0.27
-- Version de PHP: 5.2.0
-- 
-- Base de données: `BD2013`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `eleve`
-- 

CREATE TABLE `eleve` (
  `Numero` varchar(5) NOT NULL,
  `NomPrenom` varchar(50) NOT NULL,
  `DateNaiss` date NOT NULL,
  PRIMARY KEY  (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `eleve`
-- 

INSERT INTO `eleve` (`Numero`, `NomPrenom`, `DateNaiss`) VALUES 
('4SI01', 'Malek Amir', '2002-04-16'),
('4SI02', 'Yasmine Ayadi', '2003-01-17'),
('4SI03', 'Mohammed Ben Aoun', '2002-08-02'),
('4SI04', 'Youssef Graja', '2002-11-02');

-- --------------------------------------------------------

-- 
-- Structure de la table `matiere`
-- 

CREATE TABLE `matiere` (
  `Code` varchar(4) NOT NULL,
  `Libelle` varchar(60) NOT NULL,
  `Coeff` decimal(4,2) NOT NULL,
  PRIMARY KEY  (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `matiere`
-- 

INSERT INTO `matiere` (`Code`, `Libelle`, `Coeff`) VALUES 
('Algo', 'Algorithmique et Programmation', 3.00),
('BD', 'Bases de données', 1.50),
('TIC', 'Technologies de l''Information et de la Communication', 1.50);

-- --------------------------------------------------------

-- 
-- Structure de la table `note`
-- 

CREATE TABLE `note` (
  `NumEleve` varchar(5) NOT NULL,
  `CodeMatiere` varchar(4) NOT NULL,
  `DC` decimal(5,2) NOT NULL,
  `DS` decimal(5,2) NOT NULL,
  PRIMARY KEY  (`NumEleve`,`CodeMatiere`),
  KEY `NumEleve` (`NumEleve`),
  KEY `CodeMatiere` (`CodeMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `note`
-- 

INSERT INTO `note` (`NumEleve`, `CodeMatiere`, `DC`, `DS`) VALUES 
('4SI01', 'Algo', 20.00, 20.00),
('4SI01', 'BD', 15.00, 20.00),
('4SI01', 'TIC', 18.00, 20.00);

-- 
-- Contraintes pour les tables exportées
-- 

-- 
-- Contraintes pour la table `note`
-- 
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`CodeMatiere`) REFERENCES `matiere` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`NumEleve`) REFERENCES `eleve` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;
