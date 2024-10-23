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