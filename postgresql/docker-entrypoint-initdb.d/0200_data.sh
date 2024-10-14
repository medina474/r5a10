#!/bin/bash

host=http://caddy

mkdir -p /docker-entrypoint-data.d/geo
cd /docker-entrypoint-data.d/geo

# Geo

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

wget $host/regions/pays.csv
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

# Books
mkdir -p /docker-entrypoint-data.d/books
cd /docker-entrypoint-data.d/books

wget $host/books/auteurs.csv
wget $host/books/editeurs.csv
wget $host/books/participe.csv
wget $host/books/oeuvres.csv
wget $host/books/editions.csv
wget $host/books/incorpore.csv

wget $host/books/adresses.csv
wget $host/books/livraison_methode.csv


# Northwind
mkdir -p /docker-entrypoint-data.d/northwind
cd /docker-entrypoint-data.d/northwind

wget $host/northwind/marques.csv
wget $host/northwind/categories.csv
wget $host/northwind/customers.csv
wget $host/northwind/fournisseurs.csv
wget $host/northwind/shippers.csv
wget $host/northwind/banques.csv
wget $host/northwind/products.csv
wget $host/northwind/orders.csv
wget $host/northwind/marques.csv
wget $host/northwind/order_details.csv

mkdir -p /docker-entrypoint-data.d/northwind/employes
cd /docker-entrypoint-data.d/northwind/employes

wget $host/northwind/employes/zones.csv
wget $host/northwind/employes/zone_regions.csv
wget $host/northwind/employes/employes.csv
wget $host/northwind/employes/employe_regions.csv

mkdir -p /docker-entrypoint-data.d/postal
cd /docker-entrypoint-data.d/postal

wget $host/postal/zipcodes.us.csv
wget $host/postal/laposte_hexasmal.csv
