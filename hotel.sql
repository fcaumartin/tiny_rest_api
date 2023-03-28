DROP DATABASE hotel;

CREATE DATABASE hotel; 
USE hotel;

CREATE TABLE station (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(50) NOT NULL,
	altitude INT
);

CREATE TABLE hotel (
	id 			INT AUTO_INCREMENT NOT NULL,
	sta_id 		INT NOT NULL,
	nom 		VARCHAR(50) NOT NULL,
	categorie 	INT NOT NULL,
	adresse		VARCHAR(50) NOT NULL,
	ville 		VARCHAR(50) NOT NULL, 
	FOREIGN KEY (sta_id) REFERENCES station(id),
	PRIMARY KEY (id)
);

CREATE TABLE chambre (
	id INT NOT NULL AUTO_INCREMENT ,
	hot_id INT NOT NULL,
	numero INT NOT NULL,
	capacite INT NOT NULL,
	type INT NOT NULL,
	FOREIGN KEY (hot_id) REFERENCES hotel(id),
	PRIMARY KEY (id)
);

CREATE TABLE client (
	id INT NOT NULL AUTO_INCREMENT ,
	nom VARCHAR(50),
	prenom VARCHAR(50),
	adresse VARCHAR(50),
	ville VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE reservation (
	id INT NOT NULL AUTO_INCREMENT,
	cha_id INT NOT NULL ,
	cli_id INT NOT NULL ,
	`date` DATETIME NOT NULL,
	date_debut DATETIME NOT NULL,
	date_fin DATETIME NOT NULL,
	prix DECIMAL(6,2) NOT NULL,
	arrhes DECIMAL(6,2),
	FOREIGN KEY (cha_id) REFERENCES chambre(id),
	FOREIGN KEY (cli_id) REFERENCES client(id),
	PRIMARY KEY (id)
);

INSERT INTO station (id, nom, altitude) VALUES (1, 'La Montagne', 2500);
INSERT INTO station (id, nom, altitude) VALUES (2, 'Le Sud', 200);
INSERT INTO station (id, nom, altitude) VALUES (3, 'La Plage', 10);

INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (4, 2, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (5, 2, 'RR Hotel', 5, 'place du bas', 'Bretou');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (6, 2, 'La Brique', 2, 'place du haut', 'Bretou');
INSERT INTO hotel (id, sta_id, nom, categorie, adresse, ville) VALUES (7, 3, 'Le Beau Rivage', 3, 'place du centre', 'Toras');

INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 1, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 1, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 1, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 1, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 1, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 1, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 1, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 1, 7, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 1, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 2, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 2, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 2, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 2, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 2, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 2, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 2, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 2, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 2, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 3, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 3, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 3, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 3, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 3, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 3, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 3, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 3, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 3, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 4, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 4, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 4, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 4, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 4, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 4, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 4, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 4, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 4, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 5, 3, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 5, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 5, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 5, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 5, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 5, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 5, 2, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 5, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 5, 4, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 6, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (001, 7, 1, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (002, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (003, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (101, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (102, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (103, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (201, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (202, 7, 5, 1);
INSERT INTO chambre (numero, hot_id, capacite, type) VALUES (203, 7, 5, 1);

INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Doe', 'John', '', 'LA');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Homme', 'Josh', '', 'Palm Desert');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Paul', 'Weller', '', 'Londre');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('White', 'Jack', '', 'Detroit');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Claypool', 'Les', '', 'San Francisco');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Squire', 'Chris', '', 'Londre');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('Wood', 'Ronnie', '', 'Londre');

INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (1, 1, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 800);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (2, 2, '2017-01-10', '2017-07-01', '2017-07-15', 3400, 100);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (1, 3, '2017-01-10', '2017-07-01', '2017-07-15', 400, 50);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (2, 4, '2017-01-10', '2017-07-01', '2017-07-15', 7200, 1800);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (3, 5, '2017-01-10', '2017-07-01', '2017-07-15', 1400, 450);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 780);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 500, 80);
INSERT INTO reservation (cha_id, cli_id, `date`, date_debut, date_fin, prix, arrhes) VALUES (4, 1, '2017-01-10', '2017-07-01', '2017-07-15', 40, 0);

