-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 08 Juillet 2020 à 20:28
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `readmore`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(255) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(255) NOT NULL,
  `description_categorie` text NOT NULL,
  `url_couverture` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`, `description_categorie`, `url_couverture`) VALUES
(1, 'Informatique', 'L''informatique est un domaine d''activité scientifique, technique, et industriel du traitement automatique de l''information.', 'informatic.PNG'),
(2, 'mathematique', 'Les mathématiques  sont un ensemble de connaissances abstraites résultant de raisonnements logiques .', 'M.jpg'),
(3, 'physique', 'La physique est la science qui essaie de comprendre, de modéliser et d''expliquer les phénomènes naturels de l''univers.', 'physi.jpg'),
(4, 'chimie', 'La chimie est une science de la nature expérimentale qui étudie la composition de la matière et ses transformations.', 'chiMIE.jpg'),
(5, 'biologie', 'La biologie est la science du vivant. Elle recouvre une partie des sciences de nature et de l''histoire naturelle des  vivants.', 'bio.jpg'),
(6, 'littérature française', 'La littérature française comprend l''ensemble des œuvres écrites ou orales par des auteurs de nationalité française .', 'fr.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE IF NOT EXISTS `emprunt` (
  `id_emprunt` int(255) NOT NULL AUTO_INCREMENT,
  `date_emprunt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero_exemplaire` int(11) NOT NULL,
  `id_bibliothecaire` int(255) NOT NULL,
  `id_livre` int(255) NOT NULL,
  PRIMARY KEY (`id_emprunt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `emprunt`
--

INSERT INTO `emprunt` (`id_emprunt`, `date_emprunt`, `numero_exemplaire`, `id_bibliothecaire`, `id_livre`) VALUES
(1, '2020-07-02 22:33:06', 2, 2, 4),
(2, '2020-07-02 23:10:13', 5, 2, 1),
(4, '2020-07-04 09:58:23', 4, 2, 1),
(5, '2020-07-04 12:41:18', 1, 2, 14),
(7, '2020-07-06 22:43:46', 0, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `id_livre` int(255) NOT NULL AUTO_INCREMENT,
  `nbr_exemplaire` int(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `editeur` varchar(255) NOT NULL,
  `date_edition` int(255) NOT NULL,
  `description_livre` text NOT NULL,
  `url_couverture` varchar(255) NOT NULL,
  `id_categorie` int(255) NOT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_livre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`id_livre`, `nbr_exemplaire`, `isbn`, `titre`, `auteur`, `editeur`, `date_edition`, `description_livre`, `url_couverture`, `id_categorie`, `date_ajout`) VALUES
(1, 3, '2746066602', 'Réseaux informatiques', 'José Dordoigne , Sylvain Gaumé', 'Editions ENI', 2011, 'Ce livre s''adresse autant aux débutants désireux de comprendre les réseaux informatiques, \r\n                  qu''aux informaticiens plus expérimentés souhaitant renforcer et mettre à jour leurs \r\n                  connaissances...', 'info1.jpg', 1, '2020-07-04 09:58:23'),
(2, 1, '9782212172355', 'SQL pour Oracle', 'Christian Soutou', 'Eyrolles', 2011, 'Tout particulièrement destiné aux débutants et aux étudiants, cet ouvrage permet d''acquérir les notions essentielles d''Oracle, leader des systèmes de gestion de bases de données. Concis et de difficulté progressive, il est émaillé de nombreux exemples et de 50 exercices corrigés qui illustrent tous les aspects fondamentaux de SQL.', 'info4.jpg', 1, '2020-06-17 01:26:46'),
(3, 1, '9782807321885', 'Hacking et contre-hacking', 'Roger A Grimes', 'De Boeck Supérieur', 2019, 'Ce livre permet de comprendre, via les témoignages de hackers célèbres, comment hacker les hackers ! Tout savoir sur les rock stars de la cybersécurité ! Jour après jour, les whitehats (bienveillants) et les blackhats (criminels) s’affrontent dans le cyberespace pour le contrôle des technologies qui régissent notre société.', 'info2.jpg', 1, '2020-06-17 01:22:23'),
(4, 1, '9782100780051', 'Informatique avec Python', 'Jean-Noël Beury', 'Dunod', 2018, 'Cet ouvrage est un recueil d''exercices qui correspondent au programme d''informatique de la première et de la seconde année de toutes les filières : MPSI, PCSI, PTSI, MP, PC, PSI et PT.Le langage retenu est le langage Python.', 'info3.jpeg', 1, '2020-06-17 01:43:10'),
(5, -1, '9782100807604', 'Tout JavaScript', 'Hors Collection', 'Dunod', 2019, 'Ce livre s’adresse à tous les développeurs web, qu’ils soient débutants ou avancés. Le JavaScript sert avant tout à rendre les pages web interactives et dynamiques du côté de l’utilisateur, mais il est également de plus en plus souvent...', 'info5.jpeg', 1, '2020-07-06 22:43:46'),
(6, 1, '9782100812486', 'Toute l''algèbre de la lisence', 'Jean-Pierre Escofier', 'Dunod ', 2020, 'Les métaheuristiques sont parmi les méthodes d’optimisation les plus faciles à mettre en œuvre pour trouver la solution à des problèmesdifficiles voire impossibles à résoudre directement,en s’inspirant de phénomènes issus de la nature et des sciences.', 'math2.jpg', 2, '2020-06-17 10:10:43'),
(7, 1, '9782340036741', 'Initiation à l''optimisation : métaheuristiques', 'Sameh Kessentini', 'Ellipses', 2020, 'Les métaheuristiques sont parmi les méthodes d’optimisation les plus faciles à mettre en œuvre pour trouver la solution à des problèmesdifficiles voire impossibles à résoudre directement,en s’inspirant de phénomènes issus de la nature et des sciences.', 'math1.jpg', 2, '2020-06-17 11:15:58'),
(8, 1, '9782311404050', 'Algèbre linéaire, Réduction des endomorphismes', 'Roger Mansuy', 'De Boeck Superieur', 2016, 'Les métaheuristiques sont parmi les méthodes d’optimisation les plus faciles à mettre en œuvre pour trouver la solution à des problèmesdifficiles voire impossibles à résoudre directement,en s’inspirant de phénomènes issus de la nature et des sciences.', 'math4.jpg', 2, '2020-06-17 11:18:53'),
(9, 1, '9782100790029', 'Mathématiques Tout-en-un pour la Licence 1 - 3e édition', 'Collectif Dunod', 'Dunod', 2018, 'Cet ouvrage de référence couvre, en un seul volume, l''ensemble du programme de mathématiques du niveau L1. Il est composé de vingt-deux modules regroupés en cinq thèmes : Notations et vocabulaire, Algèbre, Géométrie, Analyse et enfin Probabilités et Statistiques.\r\n', 'math6.jpg', 2, '2020-06-17 12:13:26'),
(10, 1, '9782916352831', 'Algèbre : le grand combat', 'Gregory Berhuy', 'Calvage et Mounet', 2020, 'Le cours d''algèbre de licence est au coeur de la formation mathématique de l''étudiant, et constitue pour bon nombre un lieu de grand bonheur et pour d''autres une barrière dont le franchissement ne se fait pas sans souffrances.\r\n', 'math5.jpg', 2, '2020-06-17 12:15:33'),
(11, 1, '9782100776412', 'Toute la physique', 'Horst Stöcker ', 'Dunod', 2018, 'Cet ouvrage couvre l''ensemble de la physique enseignée pendant les trois années de la Licence de Physique. De la mécanique à la physique quantique tous les domaines de la physique sont abordés. L''ouvrage fournit l''ensemble des notions, des formules, des définitions et des tables de données auxquelles l''étudiant pourra facilement se reporter.', 'phy2.jpg', 3, '2020-06-19 12:27:10'),
(12, 1, '9782100800209', 'Physique tout-en-un PCSI', 'Bernard Salamito', 'Dunod', 2019, 'Les "tout-en-un" J''intègre vous proposent le cours de référence en classes préparatoires scientifiques, ainsi que de très nombreux exercices et problèmes entièrement corrigés.', 'phy1.jpg', 3, '2020-06-19 12:27:18'),
(13, 1, '9782100726561', 'Physique MPSI-PTSI - Méthodes et exercices', 'Anne-Emmanuelle Badel', 'Dunod', 2015, 'Un ensemble d''exercices pour aider les étudiants en classe préparatoire des concours des grandes écoles scientifiques, avec des conseils de méthode et les corrigés détaillés.', 'phy3.jpg', 3, '2020-06-19 12:34:29'),
(14, 0, '9782011812636', 'Physique 1ère année - MPSI PCSI PTSI - Exercices et Problèmes', 'Jean-Marie Brébec', 'Hachette', 2010, 'Ouvrage conforme aux nouveaux programmes applicables depuis septembre 2003. Il facilite l''assimilation des savoirs et des savoir-faire requis en classe préparatoire scientifique, et permet aux étudiants de s''entraîner en vue des interrogations écrites et orales pendant l''année et en vue des concours.', 'phy5.jpg', 3, '2020-07-04 12:41:18'),
(15, 1, '9782754009157', 'La physique pour les nuls', 'Dominique Meier', 'First', 2009, 'Des premières questions des Grecs aux technologies contemporaines laser les plus avancées, progressez pas à pas et entrez dans la physique, ses phénomènes, ses lois, ses applications et les hommes qui l''ont forgée : mécanique, optique, thermodynamique, électromagnétisme, les grands domaines seront abordés ici sous un angle nouveau....', 'phy4.jpg', 3, '2020-07-04 00:42:33'),
(16, 1, '9782100748310', 'Chimie Ch', 'Stéphane Perrio', 'Dunod', 2017, 'En couleurs et très illustré, ce manuel a été conçu pour vous qui débutez un cursus scientifique universitaire. Il vous permettra d''acquérir les connaissances fondamentales en physique, mais aussi la démarche et la rigueur scientifiques indispensables aux études supérieures.', 'chim1.jpg', 4, '2020-06-19 12:42:15'),
(17, 1, '9782100749430', 'Le beau livre de la chimie - De la poudre à canon aux nanotubes de carbone', 'Derek-B Lowe', 'Dunod', 2016, 'De la fabrication du bronze aux biotechnologies spatiales à l''horizon 2030, ce livre retrace en 250 grandes étapes l''histoire de la chimie. Chaque découverte est expliquée et illustrée par une magnifique image.', 'chim2.jpg', 4, '2020-06-19 12:58:57'),
(18, 1, '9782896504268', 'Chimie - Mise à niveau', 'Johanne Julien', 'Modulo', 2011, 'Chimie, mise à niveau est spécialement conçu pour les étudiants du niveau collégial qui désirent poursuivre leurs études en sciences de la nature, en soins infirmiers, en techniques physiques ou en techniques reliées au domaine de la santé.', 'chim3.jpg', 4, '2020-06-19 13:00:23'),
(19, 1, '9782100777525', '50 clés pour comprendre la chimie', 'Hayley Birch', 'Dunod', 2018, 'Ce livre est une introduction simple et concise au monde de la chimie. Des premiers atomes aux toutes dernières découvertes des nanotechnologies et aux mystères du cerveau humain...', 'chim4.jpg', 4, '2020-06-19 13:01:59'),
(20, 1, '9782100067473', 'Chimie industrielle', 'Robert Perrin,', 'Dunod', 2002, 'Fait le point sur les différents aspects de cette science carrefour qu''est la chimie industrielle. Présente tous les aspects chimiques actuels concernant l''obtention des principaux produits minéraux, métallurgiques, organiques et polymères.', 'chim5.png', 4, '2020-06-29 00:09:19'),
(21, 1, '9782804158880', 'Structure et fonction des protéines', 'Gregory A. Petsko', 'De Boeck', 2008, 'Les protéines constituent un élément central des organismes vivants. Leurs structures et leurs fonctions sont fascinantes et complexes. La révolution récente de la génomique et la mise au point de techniques informatiques d''analyse et de manipulation de la structure des protéines ont profondément bouleversé notre compréhension de l''univers de la biologie.', 'B1.jpg', 5, '2020-06-19 13:34:57'),
(22, 1, '9782294019944', 'Biologie cellulaire PCEM1', 'Marc Maillet', 'Elsevier Masson', 2006, 'L''ouvrage correspond aux orientations thématiques des enseignements : la cellule eucaryote est présentée dans sa globalité à la lumière des plus récentes découvertes. Chaque chapitre est consacré à l''étude concise, claire et approfondie d''un organite (noyau, mitochondrie, lysosome...).', 'B2.jpg', 5, '2020-06-19 13:37:10'),
(23, 1, '9782100515851', 'Biologie cellulaire en 30 fiches', 'Jean-Claude Callen', 'Dunod', 2009, 'Des principes aux applications. Comment aller à l''essentiel, comprendre les méthodes et les démarches avant de les mettre en application ? Conçue pour faciliter aussi bien l''apprentissage que la révision, la collection « Express » vous propose une présentation simple et concise en 30 fiches pédagogiques des notions de biologie moléculaire.', 'B3.jpg', 5, '2020-06-19 14:03:17'),
(24, 1, '9782100779543', 'Biologie tout-en-un BCPST 2', 'Pierre Peycru', 'Dunod', 2018, 'Les "Tout-en-un" J''intègre vous proposent le cours de réference en classes préparatoires scientifiques, ainsi que de nombreux exercices et problèmes intégralement résolus. Un cours complet conforme au programme...', 'B4.jpg', 5, '2020-06-19 14:03:17'),
(25, 1, '9782011459114', 'BIOLOGIE CELLULAIRE ,UE2 , PAES', 'Cédric Favrot', 'HACHETTE EDUCATION', 2011, 'Destinés aux étudiants de Première Année d''Études de Santé, ces ouvrages ont été conçus pour préparer efficacement les concours de médecine, pharmacie, odontologie et maïeutique. Adaptés au niveau réel des concours, ils proposent une structure claire sous forme de fiches pour accéder directement...', 'B5.png', 5, '2020-06-19 14:06:27'),
(26, 1, '9782091790626', 'Mille ans de littérature française', 'Claude Bouthier', 'Nathan', 2003, 'Ce livre de référence présente chronologiquement les principaux écrivains et leurs plus grandes œuvres en les replaçant dans leurs contextes historiques et culturels, si utiles à la compréhension des textes et au plaisir de la lecture. Plus de 150 écrivains majeurs sont présentés d''une manière vivante et détaillée.', 'FR1.jpg', 6, '2020-06-19 14:46:37'),
(27, 1, '9782035750839', 'Histoire de la Littérature Française', 'Daniel Couty', 'Larousse ', 2002, 'De la Chanson de Roland aux figures contemporaines, cet ouvrage retrace 10 siècles de la littérature française et présente, pour chaque période, les différents cadres historique, intellectuel et littéraire ainsi que leurs figures majeures.', 'FR2.jpg', 6, '2020-06-19 14:53:12'),
(28, 1, '9782340033825', 'Les 100 plus grandes oeuvres de la littérature française', 'Thierry Poyet', 'Ellipses', 2019, 'Les 100 plus grandes oeuvres recensent les volumes essentiels de la littérature française. Pour les résumer, en présenter les thèmes principaux et les replacer dans leur contexte et leur actualité, cet ouvrage se donne à lire à la fois comme un aide-mémoire pratique et une commode invite à la (re-)découverte de tous les chefs-d''oeuvre de la littérature française.', 'FR3.jpg', 6, '2020-06-19 14:56:02'),
(29, 1, '9782271089984', 'Histoire de la littérature française', 'Albert Thibaudet', 'Cnrs ', 2016, 'Chateaubriand, Hugo, Rimbaud, Flaubert, Mallarmé, Zola, Proust, Valéry. Publié pour la première fois en 1936, le chef-d''ouvre d''Albert Thibaudet revisite un siècle de littérature française à la lumière de la notion de génération.', 'FR4.jpg', 6, '2020-06-19 14:57:45'),
(30, 1, '9791037500052', 'L''Incroyable histoire de la littérature française', 'Catherine Mory', 'Arènes', 2019, 'Savez-vous que Hugo faisait tourner les tables ? Que Balzac a pensé devenir cultivateur d''ananas ? Que Voltaire appelait ses contes des "couillonnades" ? Que Pascal a inventé la première calculette ? Que Baudelaire se teignait les cheveux en vert ? Ou que La Fontaine ...', 'FR5.jpg', 6, '2020-06-19 15:02:24');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(255) NOT NULL AUTO_INCREMENT,
  `sujet_message` varchar(100) NOT NULL,
  `contenu_message` text NOT NULL,
  `date_envoie` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etat_message` int(10) DEFAULT NULL,
  `id_envoyer` int(255) NOT NULL,
  `id_recevoir` int(255) NOT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id_message`, `sujet_message`, `contenu_message`, `date_envoie`, `etat_message`, `id_envoyer`, `id_recevoir`) VALUES
(2, 'sujet message', 'salut cv hmd toi', '2020-06-10 09:12:09', 1, 1, 4),
(3, 'sujet message', 'SALAM coment va tu', '2020-06-10 09:05:24', 1, 1, 4),
(4, 'test message', 'hello mon amie cv !', '2020-06-10 09:45:55', 1, 4, 1),
(5, 'Hello ...', 'voila mon message est ....', '2020-06-10 09:45:55', 1, 4, 1),
(6, 'ma message sujet ...', 'Salut cv comment vatu !?', '2020-06-10 11:57:50', 1, 2, 1),
(7, 'test sujet ...', 'tres bien merci  ..', '2020-06-10 11:57:50', 1, 1, 4),
(8, 'qsdfghjk', 'ddqhsklazertyuiosdjkxcvbn,...', '2020-06-10 13:05:22', 1, 4, 1),
(10, 'AZERT', 'ZERTYSDFGHCVBN....', '2020-06-10 14:07:57', 1, 4, 1),
(11, 'gestion bibliotheque', 'AZERTY SDFGHCNCVBDJ', '2020-06-10 14:07:57', 1, 3, 1),
(17, 'sujet message', 'salam rehab cv !', '2020-06-18 18:25:47', 1, 1, 2),
(16, 'Nouveau sujet', 'Content mnouveau message', '2020-06-18 18:24:18', 1, 1, 3),
(15, 'test message', ' sql message ..... ', '2020-06-18 18:20:05', 1, 1, 2),
(18, 'Mon sujet', 'le contenu de mon message', '2020-06-18 23:16:35', 1, 1, 3),
(19, 'Sujet Message', 'Contenu du message ...', '2020-06-19 10:54:24', 1, 1, 3),
(20, 'sujet rehab', 'salam cv hjklmù', '2020-06-19 11:03:17', 1, 1, 2),
(21, 'rehaaaaaab', 'tetete ghjkl ,cvsdtyuio', '2020-06-21 00:41:25', 1, 1, 4),
(22, 'ojet message', 'salam cv 3lik ', '2020-06-26 12:59:36', 1, 1, 4),
(23, 'objet', 'salam cv ... ', '2020-06-26 14:57:21', 1, 1, 4),
(24, 'bonsoir', 'salam cv 3lik', '2020-06-27 21:41:34', 1, 2, 1),
(25, 'sa', 'sdfg ghj gjj ', '2020-06-29 13:27:41', 1, 2, 1),
(27, 'Probleme de reservation', 'je veux vous contactez pour reclamer un probleme au niveau de ma reservation ', '2020-07-06 21:26:06', 1, 1, 2),
(31, 'Probleme de reservation', 'vous avez un probleme au niveau des information personnel on va essaeyr de regler votre probleme. Merci ', '2020-07-06 22:41:30', -1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(255) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(255) NOT NULL,
  `prenom_personne` varchar(255) NOT NULL,
  `login_personne` varchar(255) NOT NULL,
  `password_personne` varchar(255) NOT NULL,
  `cin_personne` varchar(255) NOT NULL,
  `tel_personne` bigint(255) NOT NULL,
  `role_personne` varchar(255) NOT NULL,
  `date_inscr_personne` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_profil` int(255) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom_personne`, `prenom_personne`, `login_personne`, `password_personne`, `cin_personne`, `tel_personne`, `role_personne`, `date_inscr_personne`, `id_profil`) VALUES
(1, 'safaa', 'brouk', 'safaabrouk@gmail.com', '1234567890', 'BB123456', 700414077, 'utilisateur', '2020-06-09 07:01:38', 1),
(2, 'REHAB', 'AAKAR', 'safaabrouk1999@gmail.com', '1234567890', 'BB1234', 700414077, 'bibliothecaire', '2020-06-09 07:13:16', 2),
(3, 'Hanoun', 'Mostapha', 'admin1@gmail.com', '1234567890', 'GB1234', 668778322, 'admin', '2020-06-10 00:07:14', 3),
(4, 'aakar', 'rabab', 'rabab@gmail.com', '1234567890', 'HB1234', 700414077, 'utilisateur', '2020-06-10 00:15:31', 4),
(8, 'salima', 'salima', 'salima@gmail.com', '1234567890', 'sdfgh', 668778355, 'utilisateur', '2020-06-28 16:17:20', 8),
(9, 'sf', 'br', 'safaabr@gmail.com', '1234567890', 'sdfg', 668778355, 'utilisateur', '2020-06-28 17:22:59', 9),
(11, 'safaa', 'brouk', 'safaabrouk2@gmail.com', '1234567890', 'BJ12345', 768778355, 'utilisateur', '2020-07-06 21:04:22', 11),
(12, 'Rabab', 'aakar', 'rababaakar2@gmail.com', '1234567890', 'BG12345', 624748094, 'utilisateur', '2020-07-06 21:09:55', 12);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `id_profil` int(255) NOT NULL AUTO_INCREMENT,
  `statut` int(255) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`id_profil`, `statut`, `url_image`) VALUES
(1, 1, 'profil1593193204042.jpg'),
(2, 1, 'profil1592146648279.jpg'),
(3, 1, 'netflix.png'),
(4, 1, 'images.png'),
(8, 0, 'profil_defaut.png'),
(9, 0, 'profil_defaut.png'),
(11, 0, 'profil_defaut.png'),
(12, 0, 'profil_defaut.png');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(255) NOT NULL AUTO_INCREMENT,
  `etat_reservation` int(11) NOT NULL,
  `date_reservation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero_exemplaire` int(11) NOT NULL,
  `id_utilisateur` int(255) NOT NULL,
  `id_livre` int(255) NOT NULL,
  PRIMARY KEY (`id_reservation`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `etat_reservation`, `date_reservation`, `numero_exemplaire`, `id_utilisateur`, `id_livre`) VALUES
(13, 1, '2020-06-26 14:44:38', 5, 1, 1),
(3, 1, '2020-06-21 17:58:30', 2, 1, 4),
(4, 2, '2020-06-21 17:58:51', 0, 1, 2),
(6, 2, '2020-06-21 18:11:21', 0, 1, 30),
(7, 2, '2020-06-21 18:16:22', 0, 1, 6),
(9, 3, '2020-06-21 18:41:46', 1, 1, 15),
(10, 1, '2020-06-21 19:02:09', 1, 1, 14),
(14, 1, '2020-07-04 09:56:38', 4, 4, 1),
(12, 2, '2020-06-21 19:25:09', 0, 1, 3),
(15, 1, '2020-07-06 21:13:55', 0, 1, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
