use northwind;

-- Augmenter la limite des itérations pour cette session
set session max_recursive_iterations = 3000;

create table chronologie
with recursive calendrier as (
    select 
      CAST('2023-01-01' as date) as jour
    union all
    select
      date_add(jour, interval 1 day)
    from calendrier
      where date_add(jour, interval 1 day) <= '2025-12-31'
  )
  select 
    to_days(jour) as jj,
    jour,
    year(jour) as annee, 
    month(jour) as mois,
    day(jour) as jmois,
    week(jour, 3) as semaine,
    weekday(jour) as jsemaine,
    dayofyear(jour) as jannee,
    (month(jour) - 1) div 6 + 1 as semestre,
    (month(jour) - 1) div 4 + 1 as quadrimestre,
    quarter(jour) as trimestre,
    (month(jour) - 1) div 2 + 1 as bimestre
    from calendrier;
