create role ventdest with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

drop database if exists ventdest with (force);
create database ventdest;
alter database ventdest owner to ventdest;
grant connect on database ventdest to ventdest;

create role clients_web nologin;

\c ventdest

grant usage on schema public to clients_web;
alter default privileges in schema public grant select on tables to clients_web;

-- PostGIS
create schema postgis;
create extension if not exists postgis schema postgis;

create schema biblio;
create schema aviation;
create schema fake;
