-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 02 Décembre 2021 à 10:56
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `venteenlignedb`
--
CREATE DATABASE IF NOT EXISTS `venteenlignedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `venteenlignedb`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `Prix` float NOT NULL,
  `nom_categorie` varchar(255) NOT NULL,
  `caracteristique` varchar(255) NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `nom_categorie` (`nom_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id_article`, `nom`, `marque`, `Prix`, `nom_categorie`, `caracteristique`) VALUES
(1, 'Lenovo', 'Tkink_pad', 400000, 'categorie 1', 'RAM 8, Core i5 '),
(2, 'PH ', 'EliteBook', 300000, 'Categorie 1', 'RAM 8, Core i5'),
(3, 'Macbook', 'Apple', 1, 'catergorie 2', 'RAM 8, Core i7'),
(4, 'Dell', 'englaise', 1, 'categorie 2', 'RAM 8,Core i7');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_cat` varchar(250) NOT NULL,
  `List_article` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_cat`, `Nom_cat`, `List_article`) VALUES
(1, 'categorie 1', 'Lenovo,php,...'),
(2, 'categorie 2', 'Dell,macbook'),
(3, 'categorie 0', 'batterie 19 volt,'),
(4, 'categorie', 'sourie sans cable, clavier');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(150) NOT NULL,
  `Sexe` varchar(150) NOT NULL,
  `Tel` int(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `Nom`, `Sexe`, `Tel`, `Email`) VALUES
(1, 'Mahamat ali massar', 'Homme', 66449966, 'massar@gmail.com'),
(2, 'mariam', 'Femme', 66357622, 'mariam@gmail.com'),
(3, 'Hissen', 'Hemme', 65008380, 'hissein@gmail.com'),
(4, 'nassir', 'Hemme', 99354657, 'nassir@gmail.com'),
(5, 'Sonia', 'Hemme', 6874356, 'sonia@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id_commd` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) NOT NULL,
  `nom_article` varchar(255) NOT NULL,
  `Date_de_commd` date NOT NULL,
  `quté_commandé` int(11) NOT NULL,
  PRIMARY KEY (`id_commd`),
  KEY `nom_client` (`nom_client`,`nom_article`),
  KEY `nom_article` (`nom_article`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_commd`, `nom_client`, `nom_article`, `Date_de_commd`, `quté_commandé`) VALUES
(1, 'hissein', 'PH ', '2021-12-15', 1),
(2, 'Djalabi', 'Dell', '2021-12-21', 1),
(3, 'clotilde', 'lenovo', '2021-12-03', 2),
(4, 'Sakayo', 'Dell cat 2', '2021-12-14', 1),
(5, 'abakar', 'mackbook', '2020-12-06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `compteclient`
--

CREATE TABLE IF NOT EXISTS `compteclient` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(250) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `compteclient`
--

INSERT INTO `compteclient` (`id_client`, `nom_client`, `login`, `password`) VALUES
(1, 'abakar', 'abakar@', '1234'),
(2, 'hissein', 'hissein@', '1234'),
(3, 'mariam', 'mariam@', '1234'),
(4, 'sonia', 'sonia@', '1234'),
(5, 'idriss', 'idriss@', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `compte_admin`
--

CREATE TABLE IF NOT EXISTS `compte_admin` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id_compte`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `compte_admin`
--

INSERT INTO `compte_admin` (`id_compte`, `login`, `password`) VALUES
(1, 'Admin1', 'admin1'),
(2, 'Admin2', 'admin2'),
(3, 'Admin3', 'admin3'),
(4, 'Admin4', 'admin4'),
(5, 'Admin5', 'admin5');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id_fact` int(11) NOT NULL AUTO_INCREMENT,
  `Non_recepteur` varchar(250) NOT NULL,
  `Designation` varchar(250) NOT NULL,
  `Quantité` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL,
  `prix_total` float NOT NULL,
  `Etat_facture` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_fact`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`id_fact`, `Non_recepteur`, `Designation`, `Quantité`, `prix_unitaire`, `prix_total`, `Etat_facture`) VALUES
(1, 'Abakar', 'Macbook', 1, 1000000, 1000000, 0),
(2, 'Djalabi', 'Dell', 1, 500000, 500000, 1),
(3, 'Sonia', 'Souris', 50, 2000, 100000, 1),
(4, 'Mariam', 'Batteris', 2, 10000, 20000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fourniss` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fourniss` varchar(255) NOT NULL,
  `type_article` varchar(250) NOT NULL,
  `domaine_fonctionel` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fourniss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fourniss`, `nom_fourniss`, `type_article`, `domaine_fonctionel`) VALUES
(1, 'Abdousamal', 'Ordinateur', 'IT distributeur'),
(2, 'Mahoud', 'accessoir', 'IT');

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE IF NOT EXISTS `gerant` (
  `id_gerant` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Gerant` varchar(250) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `tel_gerant` int(11) NOT NULL,
  `compteclient` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gerant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `gerant`
--

INSERT INTO `gerant` (`id_gerant`, `nom_Gerant`, `prenom`, `sexe`, `tel_gerant`, `compteclient`) VALUES
(1, 'Osman', 'Moussa', 'Homme', 66678890, 'Administrateur'),
(2, 'Oumar', 'Tori', 'Homme', 6538966, 'Adminisatateur'),
(3, 'ali', 'hassan', 'Homme', 99765441, 'Adminisatateur'),
(4, 'Mariam', 'Abakar', 'Femme', 99789855, 'Adminisatateur'),
(5, 'kevain', 'motha', 'Homme', 69875532, 'Adminisatateur');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_livraison` varchar(250) NOT NULL,
  `Date` date NOT NULL,
  `localisation` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `livraison`
--

INSERT INTO `livraison` (`id`, `num_livraison`, `Date`, `localisation`) VALUES
(1, 'p543', '2021-12-08', 'rue_de_40'),
(2, 'P6879', '2021-12-16', 'Gassi'),
(3, 'P679', '2021-12-19', 'Diguel'),
(4, 'P009', '2021-12-21', 'Goudji'),
(5, 'P6879', '2021-12-22', 'Wallia');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `nom_article` varchar(250) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `Date_expiration` date NOT NULL,
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `nom_article` (`nom_article`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `stock`
--

INSERT INTO `stock` (`id_stock`, `nom_article`, `Quantite`, `marque`, `Date_expiration`) VALUES
(1, 'lenovo', 1067, 'HP', '2022-12-22'),
(2, 'calavier', 56, 'XXXXX', '2023-12-28');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
