\c northwind

\copy pays (code2, code3, code_num, pays, drapeau_unicode) from '/data/northwind_pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
