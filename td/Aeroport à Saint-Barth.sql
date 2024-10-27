select * from aviation.aeroports a where ST_WITHIN(coordonnees, (select geom from boundaries 
where country like 'Saint-Bart%' and name_1 is null))
