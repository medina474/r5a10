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

\copy cinema.certifications (pays_code, ordre, certification, description) from '/docker-entrypoint-data.d/cinema/certifications.csv' (format csv, header, encoding 'utf8');

\copy cinema.societes from '/docker-entrypoint-data.d/cinema/societes.csv' (format csv, header, encoding 'utf8');

\copy cinema.genres from '/docker-entrypoint-data.d/cinema/genres.csv' (format csv, header, encoding 'utf8');
select setval(pg_get_serial_sequence('cinema.genres', 'genre_id'), (select max(genre_id) from cinema.genres));

\copy cinema.franchises from '/docker-entrypoint-data.d/cinema/franchises.csv' (format csv, header, encoding 'utf8');
select setval(pg_get_serial_sequence('cinema.franchises', 'franchise_id'), (select max(franchise_id) from cinema.franchises));

\copy cinema.films(film_id,titre,titre_original,annee,sortie,duree,franchise_id,vote_votants,vote_moyenne, pays) from '/docker-entrypoint-data.d/cinema/films.csv' (format csv, header, encoding 'utf8');

create temporary table slogan_tmp (
  film_id int,
  slogan text);

\copy slogan_tmp from '/docker-entrypoint-data.d/cinema/films_slogan.csv' (format csv, header, delimiter ',', encoding 'utf8');
update cinema.films set slogan = (select slogan from slogan_tmp where slogan_tmp.film_id = films.film_id);
drop table slogan_tmp;

\copy cinema.films_genres from '/docker-entrypoint-data.d/cinema/films_genres.csv' (format csv, header, encoding 'utf8');

\copy cinema.resumes from '/docker-entrypoint-data.d/cinema/resumes.csv' (format csv, header, encoding 'utf8');

\copy cinema.productions(film_id, societe_id) from '/docker-entrypoint-data.d/cinema/productions.csv' (format csv, header, encoding 'utf8');


\copy cinema.personnes from '/docker-entrypoint-data.d/cinema/personnes.csv' (format csv, header, encoding 'utf8');

\copy cinema.equipes from '/docker-entrypoint-data.d/cinema/equipes.csv' (format csv, header, encoding 'utf8');

\copy cinema.motscles from '/docker-entrypoint-data.d/cinema/motscles.csv' (format csv, header, encoding 'utf8');
\copy cinema.films_motscles from '/docker-entrypoint-data.d/cinema/films_motscles.csv' (format csv, header, encoding 'utf8');

\copy cinema.links_personnes from '/docker-entrypoint-data.d/cinema/links_personnes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_societes from '/docker-entrypoint-data.d/cinema/links_societes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_films from '/docker-entrypoint-data.d/cinema/links_films.csv' (format csv, header, encoding 'utf8');

insert into cinema.sites (site_id, site, url) values
	(1,'TMDB (The Movie Database)','https://www.themoviedb.org/movie/$id'),
	(2,'IMDb (Internet Movie Database)','https://www.imdb.com/title/$id'),
	(3,'Wikipedia','https://fr.wikipedia.org/wiki/$id'),
	(4,'YouTube','https://youtu.be/$id'),
	(5,'Sens Critique','https://www.senscritique.com/film/_/$id'),
	(6,'AlloCiné','https://www.allocine.fr/film/fichefilm_gen_cfilm=$id.html');
