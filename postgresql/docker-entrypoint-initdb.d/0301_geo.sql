\c ventdest

create index path_gist_idx
  on geo.regions using gist (hierarchie);

create index path_idx
  on geo.regions using btree (hierarchie);
