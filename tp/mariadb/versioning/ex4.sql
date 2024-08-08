create database if not exists tp1;
use tp1;

-- 
create table if not exists `villes` (
  `id` int(10) unsigned not null auto_increment,
  `nom` varchar(100),
  `coordonnees` point not null,
  primary key (`id`),
  spatial index(coordonnees)
) engine=myisam;


create table if not exists `quartiers` (
  `id` int(10) unsigned not null auto_increment,
  `nom` varchar(100),
  `coordonnees` polygon not null,
  primary key (`id`),
  spatial index(coordonnees)
) engine=myisam;

---
truncate table `villes`;

insert into `villes` (nom, coordonnees) values 
  ('Rochebrune',PointFromText('point(10 10)')),
  ('Beaufort-sur-Mer',PointFromText('point(5 20)')),
  ('Saint-Éloi-de-Champs',PointFromText('point(25 5)')),
  ('Pont-des-Lys',PointFromText('point(20 15)')),
  ('Pépinville',PointFromText('point(28 11)'));



truncate table `quartiers`;

--

-- Quelles sont les villes les plus proches
select v1.nom, v2.nom, 
  ST_Distance(v1.coordonnees,v2.coordonnees) as d
from villes v1
join villes v2 on v2.id < v1.id order by d asc limit 1;
