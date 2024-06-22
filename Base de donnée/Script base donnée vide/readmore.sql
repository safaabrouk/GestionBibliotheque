CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(255) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(255) NOT NULL,
  `description_categorie` text NOT NULL,
  `url_couverture` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorie`)
);



CREATE TABLE IF NOT EXISTS `emprunt` (
  `id_emprunt` int(255) NOT NULL AUTO_INCREMENT,
  `date_emprunt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero_exemplaire` int(11) NOT NULL,
  `id_bibliothecaire` int(255) NOT NULL,
  `id_livre` int(255) NOT NULL,
  PRIMARY KEY (`id_emprunt`)
);

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
);



CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(255) NOT NULL AUTO_INCREMENT,
  `sujet_message` varchar(100) NOT NULL,
  `contenu_message` text NOT NULL,
  `date_envoie` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etat_message` int(10) DEFAULT NULL,
  `id_envoyer` int(255) NOT NULL,
  `id_recevoir` int(255) NOT NULL,
  PRIMARY KEY (`id_message`)
);





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
);


CREATE TABLE IF NOT EXISTS `profil` (
  `id_profil` int(255) NOT NULL AUTO_INCREMENT,
  `statut` int(255) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_profil`)
);




CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(255) NOT NULL AUTO_INCREMENT,
  `etat_reservation` int(11) NOT NULL,
  `date_reservation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero_exemplaire` int(11) NOT NULL,
  `id_utilisateur` int(255) NOT NULL,
  `id_livre` int(255) NOT NULL,
  PRIMARY KEY (`id_reservation`)
);