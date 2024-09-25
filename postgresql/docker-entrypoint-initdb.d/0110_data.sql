\c northwind

\copy pays (code2, code3, code_num, pays, drapeau_unicode, forme_longue) from '/data/geo/pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

create temporary table pays_tmp (
  nom text,
  code_num text,
  code3 text
);

\copy pays_tmp FROM '/data/geo/pays-es.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_spa = (select t.nom from pays_tmp t where pays.code3 = t.code3);

truncate table pays_tmp;

\copy pays_tmp FROM '/data/geo/pays-en.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_eng = (select t.nom from pays_tmp t where pays.code3 = t.code3);
update pays set nom_eng = 'Taiwan' where code2 = 'tw'; 

drop table pays_tmp;

\copy langues from '/data/geo/langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy pays_langues from '/data/geo/pays_langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy devises from '/data/geo/devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
--\copy pays_devises from '/data/geo/pays_devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


select '=============== FIN IMPORTATION DATA GEO' as msg;

\copy regions FROM '/data/regions/pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/at.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/au.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/be.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/bl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/ch.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/de.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/fi.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/fr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/gb.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/hr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/hu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/it.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/jp.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/lt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/lu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/nl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/pl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/pt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/se.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/ua.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM '/data/regions/us.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA REGIONS' as msg;

\copy categories from '/data/northwind/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employees from '/data/northwind/employees.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy customers from '/data/northwind/customers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy suppliers from '/data/northwind/suppliers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,supplier_id,category_id,quantity_per_unit,unit_price,units_in_stock,units_on_order,reorder_level,discontinued) from '/data/northwind/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from '/data/northwind/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy orders from '/data/northwind/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from '/data/northwind/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from '/data/northwind/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employee_territories from '/data/northwind/employee_territories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA NORTHWIND' as msg;
