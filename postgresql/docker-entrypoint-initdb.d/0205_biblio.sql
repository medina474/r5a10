\c northwind

\copy biblio.auteurs from '/docker-entrypoint-data.d/biblio/auteurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.oeuvres from '/docker-entrypoint-data.d/biblio/oeuvres.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editeurs from '/docker-entrypoint-data.d/biblio/editeurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.participe from '/docker-entrypoint-data.d/biblio/participe.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editions from '/docker-entrypoint-data.d/biblio/editions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.incorpore from '/docker-entrypoint-data.d/biblio/incorpore.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA BIBLIO' as msg;
