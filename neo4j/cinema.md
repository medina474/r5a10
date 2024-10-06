LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/films.csv' as row
CREATE (n:Film{
  film_id:row.film_id,
  titre:row.titre,
  titre_original:row.titre_original,
  annee:toInteger(row.annee),
  sortie:row.sortie,
  duree:toInteger(row.duree),
  franchise_id:row.franchise_id,
  vote_votants:toInteger(row.vote_votants),
  vote_moyenne:row.vote_moyenne,
  pays:row.pays
  })

LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/personnes.csv' as row
CREATE (n:Personne{
  personne_id:row.personne_id,
  nom:row.nom,
  prenom:row.prenom,
  naissance:row.naissance,
  deces:row.deces,
  nationalite:row.nationalite,
  artiste:row.artiste,
  popularite:row.popularite
  })

LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/genres.csv' as row
CREATE (n:Genre{
  genre_id:row.genre_id,
  genre:row.genre
  })

LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/motscles.csv' as row
CREATE (n:MotCle{
  motcle_id:row.motcle_id,
  motcle:row.motcle
  })


:auto LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/equipes.csv' AS row
CALL {
  WITH row
  MATCH (p:Personne {personne_id: row.personne_id}), (f:Film {film_id: row.film_id})
  CREATE (p)-[:ACTED_IN {role: row.role}]->(f)
} IN TRANSACTIONS OF 2 ROWS

:auto LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/films_genres.csv' AS row
CALL {
  WITH row
  MATCH (g:Genre {genre_id: row.genre_id}), (f:Film {film_id: row.film_id})
  CREATE (f)-[:GENRE_IN]->(g)
} IN TRANSACTIONS OF 2 ROWS

:auto LOAD CSV WITH HEADERS FROM 'http://caddy/cinema/films_motscles.csv' AS row
CALL {
  WITH row
  MATCH (m:MotCle {motcle_id: row.motcle_id}), (f:Film {film_id: row.film_id})
  CREATE (f)-[:MOTCLE_IN]->(m)
} IN TRANSACTIONS OF 2 ROWS
