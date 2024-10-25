\c ventdest

create table cinema.sites (
  site_id smallint not null,
  site text not null,
  url text not null
);

insert into cinema.sites values
  (1,'TMDB (The Movie Database)','https://www.themoviedb.org/movie/$id'),
  (2,'IMDb (Internet Movie Database)','https://www.imdb.com/title/$id'),
  (3,'Wikipedia','https://fr.wikipedia.org/wiki/$id'),
  (4,'YouTube','https://youtu.be/$id'),
  (5,'Sens Critique','https://www.senscritique.com/film/_/$id'),
  (6,'AlloCiné','https://www.allocine.fr/film/fichefilm_gen_cfilm=$id.html');

create table cinema.links (
  id int not null,
  site_id smallint not null,
  identifiant text not null
);

alter table cinema.links
  add constraint links_no_insert_in_parent
  check (false) no inherit;

create table cinema.links_societes (
) inherits (cinema.links);

create table cinema.links_films (
) inherits (cinema.links);

create table cinema.links_personnes (
) inherits (cinema.links);
