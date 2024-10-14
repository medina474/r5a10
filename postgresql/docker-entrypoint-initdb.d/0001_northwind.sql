create role northwind with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

drop database if exists northwind with (force);
create database northwind;
alter database northwind owner to northwind;
grant connect on database northwind to northwind;

create role clients_web nologin;

\c northwind

grant usage on schema public to clients_web;
alter default privileges in schema public grant select on tables to clients_web;

-- PostGIS
create schema postgis;
create extension if not exists postgis schema postgis;

create schema biblio;
create schema aviation;
