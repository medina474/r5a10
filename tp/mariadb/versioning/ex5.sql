create table if not exists `routes` (
  `id` int(10) unsigned not null auto_increment,
  `nom` varchar(100),
  `coordonnees` linestring not null,
  primary key (`id`),
  spatial index(coordonnees)
) engine=myisam;

truncate table `routes`;

insert into `routes` (nom, coordonnees) values 
('route AB', ST_GeomFromText('LINESTRING(10 10, 5 20)')),
('route AD', ST_GeomFromText('LINESTRING(10 10, 20 15)')),
('route AC', ST_GeomFromText('LINESTRING(10 10, 25 5)')),
('route DC', ST_GeomFromText('LINESTRING(20 15, 25 5)')),
('route CE', ST_GeomFromText('LINESTRING(25 5, 28 11)')),
('route DE', ST_GeomFromText('LINESTRING(28 11, 20 15)')),
('route BC', ST_GeomFromText('LINESTRING(5 20, 25 5)'));
