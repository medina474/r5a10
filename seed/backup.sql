\c ventdest

\copy products to '../data/ventdest/products.csv' (format csv, header, encoding 'utf8');

-- Cinema

\copy (select film_id, personne_id, role, alias, ordre from cinema.equipes order by film_id, personne_id) to '../data/cinema/equipes.csv' (format csv, header, encoding 'utf8');

\copy (select personne_id, nom, prenom, naissance, deces, nationalite, artiste, popularite from cinema.personnes order by personne_id) to '../data/cinema/personnes.csv' (format csv, header, encoding 'utf8');

\copy cinema.franchises to '../data/cinema/franchises.csv' (format csv, header, encoding 'utf8');
\copy (select film_id, genre_id from cinema.films_genres order by film_id) to '../data/cinema/films_genres.csv' (format csv, header, encoding 'utf8');

\copy (select film_id, titre, titre_original, annee, sortie, duree, franchise_id, pays from cinema.films order by film_id) to '../data/cinema/films.csv' (format csv, header, encoding 'utf8');

\copy (select film_id, slogan from cinema.films where slogan <> '' order by film_id) to '../data/cinema/films_slogan.csv' (format csv, header, delimiter ',', encoding 'utf8');
\copy (select film_id, langue_code, resume from cinema.resumes where resume <> '' order by film_id, langue_code) to '../data/cinema/resumes.csv' (format csv, header, delimiter ',', encoding 'utf8');

\copy (select societe_id, societe, uei from cinema.societes order by societe_id) to '../data/cinema/societes.csv' (format csv, header, encoding 'utf8');
\copy (select film_id, societe_id from cinema.productions order by film_id, societe_id) to '../data/cinema/productions.csv' (format csv, header, encoding 'utf8');

\copy (select film_id, motcle_id from cinema.films_motscles order by film_id, motcle_id) to '../data/cinema/films_motscles.csv' (format csv, header, encoding 'utf8');

\copy (select * from cinema.motscles order by motcle_id) to '../data/cinema/motscles.csv' (format csv, header, encoding 'utf8');

\copy (select * from cinema.votes order by film_id)  to '../data/cinema/votes.csv' (format csv, header, encoding 'utf8');

\copy (select id, site_id, identifiant from cinema.links_personnes order by id) to '../data/cinema/links_personnes.csv' (format csv, header, encoding 'utf8');
\copy (select id, site_id, identifiant from cinema.links_films order by id) to '../data/cinema/links_films.csv' (format csv, header, encoding 'utf8');

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
