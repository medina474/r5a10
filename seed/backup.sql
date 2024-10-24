\c ventdest

\copy products to '../data/ventdest/products.csv' (format csv, header, encoding 'utf8');

-- Cinema

\copy (select f_id, p_id, role, alias, ordre from cinema.equipes order by f_id, ordre) to '../data/cinema/equipes.csv' (format csv, header, encoding 'utf8');

\copy (select p_id, nom, prenom, naissance, deces, nationalite, artiste, popularite from cinema.personnes order by p_id) to '../data/cinema/personnes.csv' (format csv, header, encoding 'utf8');

\copy cinema.franchises to '../data/cinema/franchises.csv' (format csv, header, encoding 'utf8');
\copy (select f_id, genre_id from cinema.films_genres order by f_id) to '../data/cinema/films_genres.csv' (format csv, header, encoding 'utf8');

\copy cinema.links_societes to '../data/cinema/links_societes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_personnes to '../data/cinema/links_personnes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_films to '../data/cinema/links_films.csv' (format csv, header, encoding 'utf8');

\copy (select f_id, titre, titre_original, annee, sortie,duree,franchise_id,vote_votants,vote_moyenne, pays from cinema.films order by f_id) to '../data/cinema/films.csv' (format csv, header, encoding 'utf8');
\copy (select f_id, slogan from cinema.films where slogan <> '' order by f_id) to '../data/cinema/films_slogan.csv' (format csv, header, delimiter ',', encoding 'utf8');
\copy (select f_id, langue_code, resume from cinema.resumes order by f_id) to '../data/cinema/resumes.csv' (format csv, header, encoding 'utf8');

\copy (select s_id, societe, uei from cinema.societes order by s_id) to '../data/cinema/societes.csv' (format csv, header, encoding 'utf8');
\copy (select f_id, s_id from cinema.productions order by f_id, s_id) to '../data/cinema/productions.csv' (format csv, header, encoding 'utf8');

\copy (select f_id, motcle_id from cinema.films_motscles order by f_id, motcle_id) to '../data/cinema/films_motscles.csv' (format csv, header, encoding 'utf8');

\copy cinema.motscles to '../data/cinema/motscles.csv' (format csv, header, encoding 'utf8');

-- Musique
--\copy artistes to '../data/musique/artistes.csv' (format csv, header, encoding 'utf8');
--\copy membres to '../data/musique/membres.csv' (format csv, header, encoding 'utf8');
--\copy sorties to '../data/musique/sorties.csv' (format csv, header, encoding 'utf8');

-- Rando
--\copy epreuves to '../data/rando/epreuves.csv' (format csv, header, encoding 'utf8');
--\copy participants to '../data/rando/participants.csv' (format csv, header, encoding 'utf8');
--\copy points to '../data/rando/points.csv' (format csv, header, encoding 'utf8');

-- Boutique
--\copy familles to '../data/boutique/familles.csv' (format csv, header, encoding 'utf8');
