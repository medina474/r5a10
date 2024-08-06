create role strapi with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database strapi;
alter database strapi owner to strapi;
grant connect on database strapi to strapi;
