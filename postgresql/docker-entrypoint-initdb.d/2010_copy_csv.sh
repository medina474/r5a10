#!/bin/bash

host=http://caddy

mkdir -p /docker-entrypoint-data.d/aviation
cd /docker-entrypoint-data.d/aviation

wget $host/aviation/aeroports.csv
wget $host/aviation/operateurs.csv
wget $host/aviation/appareils.csv
wget $host/aviation/flights.csv
wget $host/aviation/flights2.csv
