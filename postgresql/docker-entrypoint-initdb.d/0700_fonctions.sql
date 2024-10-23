\c ventdest

CREATE FUNCTION fake_nom(text) RETURNS text as $$
WITH 
a as (
  -- Nombre aléatoire en 0 et 1. 
  -- Ne pas mettre dans la requête finale pour ne pas tirer un nombre à chaque ligne
  -- Le tirer qu'une fois
  select random() r
),
c as (
  SELECT pays, nom, popularite, 
    SUM(popularite) OVER (partition by pays ORDER BY popularite desc) AS cumulative_sum
  FROM fake.noms
),
t as (
  SELECT pays, SUM(popularite) AS total_sum FROM fake.noms group by pays
)
SELECT nom
--, c.pays 
--, c.cumulative_sum
--, total.total_sum
--, a.r
--, a.r * total.total_sum as p
--, cumulative_sum::float / t.total_sum as r2
FROM c, t, a
WHERE c.pays = $1
  and t.pays = c.pays 
	and cumulative_sum >= a.r * t.total_sum 
ORDER BY cumulative_sum
limit 1;
$$ LANGUAGE sql;

CREATE function fake_annee(in int, in int, out annee int, out sexe smallint) as $$
with 
  a as (select random() r),
  t as (select sum(nombre) as total_sum from fake.pyramide where annee > $1 and annee < $2),
  c as (select sexe, annee, sum(nombre) OVER (ORDER BY annee, sexe) as cumulative_sum 
  	from fake.pyramide where annee > $1 and annee < $2) 
select annee, sexe
 from a, c, t
 where cumulative_sum >= a.r * t.total_sum
 limit 1;
$$ LANGUAGE sql;

create function fake_personne(in text, in int, in int, out nom text, out annee int, out sexe smallint) as $$
with
a as (select annee, sexe from fake_annee($2, $3)),
nom as (select fake_nom($1))
select fake_nom, annee, sexe from a, nom
$$ LANGUAGE sql;


create trigger trigger_vote_insert
  after insert
  on cinema.votes
  for each row
  execute function vote_calcul();

create trigger trigger_vote_update
  after update
  on cinema.votes
  for each row
  execute function vote_calcul();

create function cinema.films_with_texte(mot text)
returns table (film_id cinema.films.film_id%TYPE
  , titre cinema.films.titre%TYPE)
language sql
as $function$
	select f.film_id, f.titre from cinema.films f
    inner join cinema.resumes r on f.film_id = r.film_id
  where ts @@ to_tsquery('french', mot);
$function$;

create function cinema.reco()
  returns table (id cinema.films.film_id%TYPE
  ,titre cinema.films.titre%type
  ,vote_votants cinema.films.vote_votants%type
  ,vote_moyenne cinema.films.vote_moyenne%type
  ,score float)
  language 'plpgsql'
as $body$
declare
  C float;
  m int;
begin
  select avg(f.vote_moyenne) into C
    from cinema.films f;
  select percentile_disc(0.9) into m
    within group (order by cinema.films.vote_votants)
    from cinema.films;
  return query select f.film_id, f.titre, f.vote_votants
  	,f.vote_moyenne
  	,(f.vote_votants::numeric /(f.vote_votants::numeric + m) * f.vote_moyenne) + (m /(f.vote_votants::numeric + m) * C) as score
    from cinema.films f
    where f.vote_votants >= m
    order by score desc
    limit 10;
end
$body$;

create function cinema.films_par_acteur (id varchar)
RETURNS TABLE(film_id uuid, titre text, titre_original text,
annee int, sortie date, duree int, vote_votants int, vote_moyenne numeric(4,2), franchise text, alias text[], genres text[], motscles text[], resume text) AS
$$
BEGIN
  return query select f.film_id, f.titre, f.titre_original,
      f.annee, f.sortie, f.duree, f.vote_votants, f.vote_moyenne,
      f2.franchise
      , array_agg(distinct e.alias) as alias
      , array_agg(distinct g.genre) as genres
      , array_agg(distinct mc.motcle) as motscles
      , r.resume
    from cinema.films f
    inner join cinema.equipes e on e.film_id = f.film_id and e.alias is not null
    left join cinema.films_genres fg on fg.film_id = f.film_id
    left join cinema.genres g on g.genre_id = fg.genre_id
    left join cinema.franchises f2 on f2.franchise_id = f.franchise_id
    left join lateral (SELECT r2.resume FROM cinema.resumes r2 WHERE r2.film_id  = f.film_id 
      order by array_position(array['deu','fra','eng'], r2.langue_code)
      fetch first 1 row only ) r on true
    left join cinema.films_motscles fmc on fmc.film_id = f.film_id
    left join cinema.motscles mc on mc.motcle_id = fmc.motcle_id
    where e.personne_id = id::uuid
    group by f.film_id, f.titre, f.titre_original, f2.franchise, f.vote_votants, e.ordre, r.resume
    order by e.ordre, vote_votants desc;
END;
$$
language plpgsql volatile;

create or replace function cinema.etablissements_in_view(min_lat float, min_long float, max_lat float, max_long float)
returns table (etablissement_id etablissements.etablissement_id%TYPE
  , nom etablissements.nom%TYPE
	, ville etablissements.ville%TYPE
	, voie etablissements.voie%TYPE
	, codepostal etablissements.codepostal%TYPE
	, lat float, long float)
language sql
as $function$
	select etablissement_id
		, nom
		, ville
		, voie
		, codepostal
		, st_y(coordonnees::geometry) as lat, st_x(coordonnees::geometry) as long
	from cinema.etablissements
	where coordonnees && ST_SetSRID(ST_MakeBox2D(ST_Point(min_long, min_lat), ST_Point(max_long, max_lat)), 4326)
$function$;
