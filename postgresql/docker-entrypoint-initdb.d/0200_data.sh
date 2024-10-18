#!/bin/bash

host=http://caddy

# Fake

mkdir -p /docker-entrypoint-data.d/fake
cd /docker-entrypoint-data.d/fake

wget $host/fake/personnes.csv
wget $host/fake/noms.fr.csv
wget $host/fake/noms.gb.csv
wget $host/fake/noms.de.csv
wget $host/fake/noms.it.csv
wget $host/fake/noms.es.csv
wget $host/fake/noms.pt.csv
wget $host/fake/noms.nl.csv
wget $host/fake/noms.se.csv
wget $host/fake/prenoms.csv
wget $host/fake/pyramide.csv

# Geo

mkdir -p /docker-entrypoint-data.d/geo
cd /docker-entrypoint-data.d/geo

wget $host/geo/pays.csv
wget $host/geo/pays-es.txt
wget $host/geo/pays-en.txt
wget $host/geo/langues.csv
wget $host/geo/pays_langues.csv
wget $host/geo/devises.csv
wget $host/geo/pays_devises.csv
wget $host/geo/worldcities.csv

mkdir -p /docker-entrypoint-data.d/regions
cd /docker-entrypoint-data.d/regions

wget $host/regions/regions.csv
wget $host/regions/at.csv
wget $host/regions/au.csv
wget $host/regions/be.csv
wget $host/regions/bl.csv
wget $host/regions/ch.csv
wget $host/regions/de.csv
wget $host/regions/fi.csv
wget $host/regions/fr.csv
wget $host/regions/gb.csv
wget $host/regions/hr.csv
wget $host/regions/hu.csv
wget $host/regions/it.csv
wget $host/regions/jp.csv
wget $host/regions/lt.csv
wget $host/regions/lu.csv
wget $host/regions/nl.csv
wget $host/regions/pl.csv
wget $host/regions/pt.csv
wget $host/regions/se.csv
wget $host/regions/ua.csv
wget $host/regions/us.csv

# Aviation
mkdir -p /docker-entrypoint-data.d/aviation
cd /docker-entrypoint-data.d/aviation

wget $host/aviation/aeroports.csv

# Biblio
mkdir -p /docker-entrypoint-data.d/biblio
cd /docker-entrypoint-data.d/biblio

wget $host/biblio/auteurs.csv
wget $host/biblio/editeurs.csv
wget $host/biblio/participe.csv
wget $host/biblio/oeuvres.csv
wget $host/biblio/editions.csv
wget $host/biblio/incorpore.csv

wget $host/biblio/adresses.csv
wget $host/biblio/livraison_methode.csv


# Vent d'Est
mkdir -p /docker-entrypoint-data.d/ventdest
cd /docker-entrypoint-data.d/ventdest

wget $host/ventdest/marques.csv
wget $host/ventdest/categories.csv
wget $host/ventdest/clients.csv
wget $host/ventdest/fournisseurs.csv
wget $host/ventdest/shippers.csv
wget $host/ventdest/banques.csv
wget $host/ventdest/products.csv
wget $host/ventdest/orders.csv
wget $host/ventdest/marques.csv
wget $host/ventdest/order_details.csv

mkdir -p /docker-entrypoint-data.d/ventdest/employes
cd /docker-entrypoint-data.d/ventdest/employes

wget $host/ventdest/employes/zones.csv
wget $host/ventdest/employes/zone_regions.csv
wget $host/ventdest/employes/employes.csv
wget $host/ventdest/employes/employe_regions.csv

mkdir -p /docker-entrypoint-data.d/postal
cd /docker-entrypoint-data.d/postal

wget $host/postal/zipcodes.us.csv
wget $host/postal/laposte_hexasmal.csv
