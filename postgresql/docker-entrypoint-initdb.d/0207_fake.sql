\c ventdest

\copy fake.personnes from '/docker-entrypoint-data.d/fake/personnes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.fr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.gb.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.de.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.it.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.es.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.pt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.nl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fake.noms from '/docker-entrypoint-data.d/fake/noms.se.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy fake.prenoms from '/docker-entrypoint-data.d/fake/prenoms.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy fake.pyramide from '/docker-entrypoint-data.d/fake/pyramide.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
