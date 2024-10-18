\c ventdest

create table fake.personnes (
  id integer,
  nom text,
  prenom text,
  genre smallint,
  naissance date,
  pays text
);

create table fake.noms (
  nom text,
  popularite int,
  pays text
);

create table fake.prenoms (
  prenom text,
  sexe smallint
);

create table fake.pyramide (
  annee smallint,
  sexe smallint,
  nombre int
);
