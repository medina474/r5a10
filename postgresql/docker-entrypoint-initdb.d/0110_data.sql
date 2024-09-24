\c northwind

\copy pays (code2, code3, code_num, pays, drapeau_unicode, forme_longue) from 'geo/pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

create temporary table pays_tmp (
  nom text,
  code_num text,
  code3 text
);

\copy pays_tmp FROM 'geo/pays-es.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_spa = (select t.nom from pays_tmp t where pays.code3 = t.code3);

truncate table pays_tmp;

\copy pays_tmp FROM 'geo/pays-en.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_eng = (select t.nom from pays_tmp t where pays.code3 = t.code3);
update pays set nom_eng = 'Taiwan' where code2 = 'tw'; 

drop table pays_tmp;

\copy langues from 'geo/langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy pays_langues from 'geo/pays_langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy devises from 'geo/devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy pays_devises from 'geo/pays_devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


select '=============== FIN IMPORTATION DATA GEO' as msg;

\copy regions FROM 'regions/pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/at.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/au.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/be.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/bl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/ch.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/de.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/fi.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/fr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/gb.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/hr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/hu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/it.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/jp.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/lt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/lu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/nl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/pl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/pt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/se.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/ua.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy regions FROM 'regions/us.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA REGIONS' as msg;

\copy categories from 'northwind/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employees from 'northwind/employees.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy customers from 'northwind/customers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy suppliers from 'northwind/suppliers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,supplier_id,category_id,quantity_per_unit,unit_price,units_in_stock,units_on_order,reorder_level,discontinued) from 'northwind/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from 'northwind/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy orders from 'northwind/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from 'northwind/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from 'northwind/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employee_territories from 'northwind/employee_territories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA NORTHWIND' as msg;
