with 
  t as (select sum(nombre) as total from pyramide),
  c as (select sexe, annee, sum(nombre) OVER (ORDER BY annee, sexe) as cumulative from pyramide) 
update 
 pyramide set cumulative = c.cumulative / t.total
 from c, t
 where pyramide.sexe = c.sexe and pyramide.annee = c.annee
 
with r as (select random() as rnd)
 select * from pyramide, r 
where cumulative >= r.rnd
order by cumulative
fetch first 1 rows only