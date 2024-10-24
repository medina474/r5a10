\c ventdest

\copy products to '../data/ventdest/products.csv' (format csv, header, encoding 'utf8');

-- Cinema

\copy cinema.equipes to '../data/cinema/equipes.csv' (format csv, header, encoding 'utf8');

\copy cinema.personnes to '../data/cinema/personnes.csv' (format csv, header, encoding 'utf8');

\copy cinema.franchises to '../data/cinema/franchises.csv' (format csv, header, encoding 'utf8');
\copy cinema.films_genres to '../data/cinema/films_genres.csv' (format csv, header, encoding 'utf8');

\copy cinema.links_societes to '../data/cinema/links_societes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_personnes to '../data/cinema/links_personnes.csv' (format csv, header, encoding 'utf8');
\copy cinema.links_films to '../data/cinema/links_films.csv' (format csv, header, encoding 'utf8');

\copy cinema.societes to '../data/cinema/societes.csv' (format csv, header, encoding 'utf8');
\copy cinema.productions to '../data/cinema/productions.csv' (format csv, header, encoding 'utf8');

\copy cinema.films(film_id,titre,titre_original,annee,sortie,duree,franchise_id,vote_votants,vote_moyenne, pays) to '../data/cinema/films.csv' (format csv, header, encoding 'utf8');
\copy cinema.resumes to '../data/cinema/resumes.csv' (format csv, header, encoding 'utf8');
\copy (select film_id, slogan from cinema.films where slogan <> '') to '../data/cinema/films_slogan.csv' (format csv, header, delimiter ',', encoding 'utf8');

\copy cinema.motscles to '../data/cinema/motscles.csv' (format csv, header, encoding 'utf8');
\copy cinema.films_motscles to '../data/cinema/films_motscles.csv' (format csv, header, encoding 'utf8');

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
