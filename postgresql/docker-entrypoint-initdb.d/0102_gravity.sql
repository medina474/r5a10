  --\c northwind

  --DROP TABLE IF EXISTS commande_historique;
  --DROP TABLE IF EXISTS commande_ligne;
  --DROP TABLE IF EXISTS commande;
  --DROP TABLE IF EXISTS commande_statut;
  --DROP TABLE IF EXISTS livraison_methode;

  --DROP TABLE IF EXISTS adherent_adresse;
  --DROP TABLE IF EXISTS adherents;
  --DROP TABLE IF EXISTS adresses;

  
  --DROP TABLE IF EXISTS exemplaires;
  --DROP TABLE IF EXISTS relations;
  --DROP TABLE IF EXISTS collections;
  --DROP TABLE IF EXISTS incorpore;
  --DROP TABLE IF EXISTS editions;
  --DROP TABLE IF EXISTS participe;
  --DROP TABLE IF EXISTS auteurs;
  --DROP TABLE IF EXISTS oeuvres;
  --DROP TABLE IF EXISTS editeurs;
  --DROP TABLE IF EXISTS series;
  --DROP TABLE IF EXISTS genres;
  
  
  -- Lookup tables
  --DROP TABLE IF EXISTS langues;
  --DROP TABLE IF EXISTS pays;
  --DROP TABLE IF EXISTS statuts;

--
-- PRAGMA integrity_check;
-- PRAGMA foreign_key_check; 

CREATE TABLE langues (
  langue_id INTEGER,
  langue_code VARCHAR(5) PRIMARY KEY,
  langue TEXT
);


CREATE TABLE series (
  serie_id INTEGER PRIMARY KEY,
  serie TEXT
);

CREATE TABLE genres (
  genre_id INTEGER PRIMARY KEY,
  genre TEXT
);



CREATE TABLE relations (
  reference_id INTEGER, -- REFERENCES oeuvres (oeuvre_id),
  oeuvre_id INTEGER, -- REFERENCES oeuvres (oeuvre_id),
  type TEXT,
  CONSTRAINT pk_relation PRIMARY KEY (reference_id, oeuvre_id)
);

CREATE TABLE statuts (
  statut_id INTEGER PRIMARY KEY,
  statut TEXT
);

CREATE TABLE pays (
  pays_id INTEGER PRIMARY KEY,
  pays_name TEXT
);

CREATE TABLE adresses (
  adresse_id INTEGER PRIMARY KEY,
  numero TEXT,
  voie TEXT,
  ville TEXT,
  pays_id INTEGER -- REFERENCES pays (pays_id) 
);

CREATE TABLE adherents (
  adherent_id INTEGER PRIMARY KEY,
  prenom TEXT NOT NULL,
  nom TEXT NOT NULL,
  email TEXT,
  naissance CHAR(10),
  statut_id INTEGER,
  CONSTRAINT fk_a_statut FOREIGN KEY (statut_id) REFERENCES statuts (statut_id)
);

CREATE TABLE adherent_adresse (
  adherent_id INTEGER NOT NULL, -- REFERENCES adherents (adherent_id),
  adresse_id INTEGER NOT NULL, -- REFERENCES adresses (adresse_id),
  statut_id INTEGER,
  CONSTRAINT pk_adherent_adresse PRIMARY KEY (adherent_id, adresse_id)
  -- CONSTRAINT fk_aa_statut FOREIGN KEY (statut_id) REFERENCES statuts (statut_id)
);

CREATE TABLE livraison_methode (
  methode_id INTEGER PRIMARY KEY,
  methode_name TEXT,
  cout NUMERIC
);

CREATE TABLE commande (
  commande_id INTEGER PRIMARY KEY,
  commande_date TIMESTAMP,
  date_echeance DATE,
  adherent_id INTEGER, -- REFERENCES adherents (adherent_id),
  livraison_methode_id INTEGER, -- REFERENCES livraison_methode (methode_id),
  dest_adresse_id INTEGER -- REFERENCES adresses (adresse_id)
);

CREATE TABLE commande_statut (
  statut_id INTEGER PRIMARY KEY,
  statut_value TEXT
);

CREATE TABLE commande_ligne (
  ligne_id INTEGER PRIMARY KEY,
  commande_id INTEGER, -- REFERENCES commande (commande_id),
  exemplaire_id INTEGER, -- REFERENCES exemplaires (exemplaire_id),
  cout NUMERIC,
  date_retour TIMESTAMP
);

CREATE TABLE commande_historique (
  historique_id INTEGER PRIMARY KEY,
  commande_id INTEGER, -- REFERENCES commande (commande_id),
  statut_id INTEGER, -- REFERENCES commande_statut (statut_id),
  statut_date TIMESTAMP
);
