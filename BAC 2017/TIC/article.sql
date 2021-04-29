-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Jeudi 29 Avril 2021 à 12:23
-- Version du serveur: 5.0.27
-- Version de PHP: 5.2.0
-- 
-- Base de données: `BD2017`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `article`
-- 

CREATE TABLE `article` (
  `Code` int(11) NOT NULL,
  `Libelle` varchar(30) NOT NULL,
  `PrixBase` int(11) NOT NULL,
  PRIMARY KEY  (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `article`
-- 

INSERT INTO `article` (`Code`, `Libelle`, `PrixBase`) VALUES 
(36, 'Luth du Hedi Jouini', 525),
(45, 'Manuscrit d''Abou el Kacem Eche', 8520),
(120, 'Les gants du gardien Attouga', 453),
(212, 'Voiture 202 Bh', 25470);
