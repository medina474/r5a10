\c northwind

\copy biblio.auteurs from '/docker-entrypoint-data.d/books/auteurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.oeuvres from '/docker-entrypoint-data.d/books/oeuvres.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editeurs from '/docker-entrypoint-data.d/books/editeurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.participe from '/docker-entrypoint-data.d/books/participe.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editions from '/docker-entrypoint-data.d/books/editions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.incorpore from '/docker-entrypoint-data.d/books/incorpore.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA BOOKS' as msg;
