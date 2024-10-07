#!/bin/bash

host=http://caddy

mkdir -p /docker-entrypoint-data.d/northwind
cd /docker-entrypoint-data.d/northwind

wget $host/northwind/categories.csv
wget $host/northwind/territories.csv
wget $host/northwind/employees.csv
wget $host/northwind/employee_territories.csv
wget $host/northwind/customers.csv
wget $host/northwind/suppliers.csv
wget $host/northwind/shippers.csv
wget $host/northwind/banques.csv
wget $host/northwind/products.csv
wget $host/northwind/orders.csv
wget $host/northwind/order_details.csv

cd /docker-entrypoint-data.d/geo
wget $host/geo/pays.csv
wget $host/geo/pays-es.csv
wget $host/geo/pays-en.csv
wget $host/geo/langues.csv
wget $host/geo/pays_langues.csv
