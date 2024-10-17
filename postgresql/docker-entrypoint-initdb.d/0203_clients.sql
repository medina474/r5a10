\c ventdest

\copy fake.personnes from '/docker-entrypoint-data.d/fake/personnes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy clients from '/docker-entrypoint-data.d/ventdest/clients.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
