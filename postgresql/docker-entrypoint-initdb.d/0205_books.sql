\c northwind

\copy auteurs from '/docker-entrypoint-data.d/books/auteurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy oeuvres from '/docker-entrypoint-data.d/books/oeuvres.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy editeurs from '/docker-entrypoint-data.d/books/editeurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy participe from '/docker-entrypoint-data.d/books/participe.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy editions from '/docker-entrypoint-data.d/books/editions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy incorpore from '/docker-entrypoint-data.d/books/incorpore.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy adresses from '/docker-entrypoint-data.d/books/adresses.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy livraison_methode from '/docker-entrypoint-data.d/books/livraison_methode.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA BOOKS' as msg;
