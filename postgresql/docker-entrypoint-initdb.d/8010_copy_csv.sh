#!/bin/bash

host=http://caddy

mkdir -p /docker-entrypoint-data.d/cinema
cd /docker-entrypoint-data.d/cinema

wget $host/cinema/certifications.csv
wget $host/cinema/equipes.csv
wget $host/cinema/films_genres.csv
wget $host/cinema/films_motscles.csv
wget $host/cinema/films_slogan.csv
wget $host/cinema/films.csv
wget $host/cinema/franchises.csv
wget $host/cinema/genres.csv
wget $host/cinema/motscles.csv
wget $host/cinema/personnes.csv
wget $host/cinema/productions.csv
wget $host/cinema/resumes.csv
wget $host/cinema/societes.csv

wget $host/cinema/cnc-données-cartographie-2021.csv

wget $host/cinema/votes.csv

wget $host/cinema/links_films.csv
wget $host/cinema/links_personnes.csv
wget $host/cinema/links_societes.csv
