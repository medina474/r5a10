\c northwind

\copy pays (code2, code3, code_num, pays, drapeau_unicode) from 'northwind_pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy employees from 'northwind/employees.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy customers from 'northwind/customers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy suppliers from 'northwind/suppliers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products from 'northwind/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy orders from 'northwind/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select 'FIN IMPORTATION DATA NORTHWIND' as msg
