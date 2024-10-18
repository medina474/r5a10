\c ventdest

create index pays_nom
  on pays using btree (pays asc nulls last);

create index auteur_nom
  on biblio.auteurs using btree (nom asc nulls last);

create index path_gist_idx on regions using gist (hierarchie);
create index path_idx on regions using btree (hierarchie);
create index path_hash_idx on regions using hash (hierarchie);

update orders set order_date = order_date + INTERVAL '3 years',
  required_date = required_date + INTERVAL '3 years',
  shipped_date = shipped_date + INTERVAL '3 years';

update fake.personnes set
  nom = null
  from fake.noms n where n.nom = fake.personnes.nom
