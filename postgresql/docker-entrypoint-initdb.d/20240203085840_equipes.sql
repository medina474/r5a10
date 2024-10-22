\c ventdest

create index equipe_films_fki
  on cinema.equipes(film_id);

create index equipe_personnes_fki
  on cinema.equipes(personne_id);
