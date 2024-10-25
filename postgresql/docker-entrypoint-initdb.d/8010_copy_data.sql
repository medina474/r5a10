\c ventdest

\copy cinema.certifications (pays_code, ordre, certification, description) from '/docker-entrypoint-data.d/cinema/certifications.csv' (format csv, header, encoding 'utf8');

\copy cinema.societes from '/docker-entrypoint-data.d/cinema/societes.csv' (format csv, header, encoding 'utf8');

\copy cinema.genres from '/docker-entrypoint-data.d/cinema/genres.csv' (format csv, header, encoding 'utf8');
select setval(pg_get_serial_sequence('cinema.genres', 'genre_id'), (select max(genre_id) from cinema.genres));

\copy cinema.franchises from '/docker-entrypoint-data.d/cinema/franchises.csv' (format csv, header, encoding 'utf8');
select setval(pg_get_serial_sequence('cinema.franchises', 'franchise_id'), (select max(franchise_id) from cinema.franchises));

\copy cinema.films(film_id,titre,titre_original,annee,sortie,duree,franchise_id, pays) from '/docker-entrypoint-data.d/cinema/films.csv' (format csv, header, encoding 'utf8');

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

\copy cinema.votes from '/docker-entrypoint-data.d/cinema/votes.csv' (format csv, header, encoding 'utf8');

\copy cinema.links_films from '/docker-entrypoint-data.d/cinema/links_films.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_personnes from '/docker-entrypoint-data.d/cinema/links_personnes.csv' (format csv, header, encoding 'utf8');
