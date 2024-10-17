\c ventdest

\copy fake.personnes from '/docker-entrypoint-data.d/fake/personnes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.fr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.gb.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.de.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.es.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.it.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.prenoms from '/docker-entrypoint-data.d/fake/prenoms.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy clients from '/docker-entrypoint-data.d/ventdest/clients.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
