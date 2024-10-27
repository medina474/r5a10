show server_version;

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


\c ventdest

-- Role public
create role role_web nologin;

grant usage on schema public to role_web;
alter default privileges in schema public grant select on tables to role_web;

-- Schémas
create schema ext;

create schema fake;
create schema musique;

-- PostGIS
create schema postgis;
create extension postgis schema postgis;

create extension ltree schema public;
create extension pg_idkit schema ext;
create extension vector schema ext;
create extension fuzzystrmatch schema ext;

\dx
