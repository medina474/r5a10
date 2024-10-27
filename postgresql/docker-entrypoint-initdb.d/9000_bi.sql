\c ventdest

create schema bi;

create table bi.chronologie as
  with recursive calendrier as (
    select 
      '2023-01-01 00:00:00'::timestamp as jour
    union all
    select
      jour + interval '1 day'
    from calendrier
      where jour + interval '1 day' <= '2025-12-31'
  )
  select 
    extract(epoch from jour) / 86400::int as jj,
    jour,
    extract (year from jour) as annee, 
    extract (month from jour) as mois,
    extract (day from jour) as jmois,
    extract (week from jour) as semaine,
    extract (dow from jour) as jsemaine,
    extract (doy from jour) as jannee,
    (extract(month from jour) - 1) / 6 + 1 as semestre,
    (extract(month from jour) - 1) / 4 + 1 as quadrimestre,
    extract(quarter from jour)::int as trimestre,
    (extract(month from jour) - 1) / 2 + 1 as bimestre
  from calendrier;
