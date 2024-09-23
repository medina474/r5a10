create temporary table json (
  properties JSONB
)

\copy aeroports_tmp from 'couchdb/velos.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
