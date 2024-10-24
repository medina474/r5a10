\c ventdest

alter table cinema.etablissements
  add primary key (etablissement_id);

alter table cinema.personnes
  add primary key (personne_id);

alter table cinema.genres
  add primary key (genre_id);

alter table cinema.films_genres
  add primary key (film_id, genre_id);

alter table cinema.productions
  add primary key (film_id, societe_id);

alter table cinema.resumes
  add primary key (film_id, langue_code);

alter table cinema.societes
  add primary key (societe_id);

alter table cinema.franchises 
  alter column franchise_id 
    add generated by default as identity (
      sequence name franchise_id_seq
      start with 1
      increment by 1
      no minvalue
      no maxvalue
      cache 1
    );

alter table cinema.franchises
  add primary key (franchise_id);

alter table cinema.seances
  add primary key (seance_id);

alter table cinema.salles
  add primary key (salle_id);

alter table cinema.motscles
  add primary key (motcle_id);

alter table cinema.films
  add primary key (film_id);

alter table cinema.sites
  add primary key (site_id);

alter table cinema.links
  add primary key (id, site_id);

alter table cinema.links_societes
  add constraint links_societes_pkey 
  primary key (id, site_id);

alter table cinema.links_films
  add constraint links_films_pkey 
  primary key (id, site_id);

alter table cinema.links_personnes
  add constraint links_personnes_pkey 
  primary key (id, site_id);

create unique index film_motscles_pkey 
  on cinema.films_motscles
  using btree (film_id, motcle_id);

alter table cinema.films_motscles
  add primary key 
  using index film_motscles_pkey;

create unique index certifications_pk
  on cinema.certifications
  using btree (pays_code, certification);

alter table cinema.certifications
  add primary key using index certifications_pk;
