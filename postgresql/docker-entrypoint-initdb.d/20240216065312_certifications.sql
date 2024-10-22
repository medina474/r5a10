\c ventdest

alter table cinema.certifications
  drop column certification_id;

alter table cinema.certifications
  alter column certification set not null;

alter table cinema.certifications
  alter column pays set not null;

create index certifications_pays_idx
  on cinema.certifications
  using btree (pays, ordre);

create unique index certifications_pk
  on cinema.certifications
  using btree (pays, certification);

alter table cinema.certifications
  add constraint certifications_pk
  primary key using index certifications_pk;
