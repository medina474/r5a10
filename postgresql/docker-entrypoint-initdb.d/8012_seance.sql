\c ventdest

create temporary table etablissements_tmp (
  nauto integer,
  nom text,
  région_administrative text,
  adresse text,
  code_insee text,
  commune text,
  population text,
  dep text,
  nuu text,
  unité_urbaine text,
  population_unité_urbaine text,
  situation_géographique text,
  écrans text,
  fauteuils text,
  semaines_activité text,
  séances text,
  entrées_2021 text,
  entrées_2020 text,
  évolution_entrées text,
  tranche_entrées text,
  propriétaire text,
  programmateur text,
  ae text,
  catégorie_art_et_essai text,
  label_art_et_essai text,
  genre text,
  multiplexe text,
  zone_commune text,
  nombre_films_programmés text,
  nombre_films_inédits text,
  nombre_films_en_semaine_1 text,
  pdm_films_français text,
  pdm_films_américains text,
  pdm_films_européens text,
  pdm_autres_films text,
  films_art_et_essai text,
  part_séances_films_art_et_essai text,
  pdm_films_art_et_essai text,
  latitude float,
  longitude float
);

\copy etablissements_tmp from '/docker-entrypoint-data.d/cinema/cnc-données-cartographie-2021.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

insert into cinema.etablissements (etablissement_id, nom, voie, ville, coordonnees)
  select nauto, nom, adresse, commune, postgis.st_makepoint(longitude, latitude)
  from etablissements_tmp;

drop table etablissements_tmp;
