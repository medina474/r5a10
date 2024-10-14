use northwind;

set character_set_client='utf8';
set character_set_connection='utf8';
set character_set_database='utf8';
set character_set_results='utf8';
set character_set_server='utf8';

INSERT INTO employes VALUES(1,'Davolio','Nancy','1988-12-08','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''.');
INSERT INTO employes VALUES(2,'Fuller','Andrew','1972-02-19','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.');
INSERT INTO employes VALUES(3,'Leverling','Janet','1983-08-30','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.');
INSERT INTO employes VALUES(4,'Peacock','Margaret','1978-09-19','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.');
INSERT INTO employes VALUES(5,'Buchanan','Steven','1975-03-04','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French.');
INSERT INTO employes VALUES(6,'Suyama','Michael','1983-07-02','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.');
INSERT INTO employes VALUES(7,'King','Robert','1980-05-29','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office.');
INSERT INTO employes VALUES(8,'Callahan','Laura','1978-01-09','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.');
INSERT INTO employes VALUES(9,'Dodsworth','Anne','1989-07-02','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.');
INSERT INTO employes VALUES(10,'West','Adam','1961-09-19','EmpID10.pic','An old chum.');

INSERT INTO employe_territories VALUES (1, '06897'),
  (1, '19713'),
  (2, '01581'),
  (2, '01730'),
  (2, '01833'),
  (2, '02116'),
  (2, '02139'),
  (2, '02184'),
  (2, '40222'),
  (3, '30346'),
  (3, '31406'),
  (3, '32859'),
  (3, '33607'),
  (4, '20852'),
  (4, '27403'),
  (4, '27511'),
  (5, '02903'),
  (5, '07960'),
  (5, '08837'),
  (5, '10019'),
  (5, '10038'),
  (5, '11747'),
  (5, '14450'),
  (6, '85014'),
  (6, '85251'),
  (6, '98004'),
  (6, '98052'),
  (6, '98104'),
  (7, '60179'),
  (7, '60601'),
  (7, '80202'),
  (7, '80909'),
  (7, '90405'),
  (7, '94025'),
  (7, '94105'),
  (7, '95008'),
  (7, '95054'),
  (7, '95060'),
  (8, '19428'),
  (8, '44122'),
  (8, '45839'),
  (8, '53404'),
  (9, '03049'),
  (9, '03801'),
  (9, '48075'),
  (9, '48084'),
  (9, '48304'),
  (9, '55113'),
  (9, '55439');

INSERT INTO fournisseurs VALUES(1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','Londona','EC1 4SD','UK','(171) 555-2222');
INSERT INTO fournisseurs VALUES(2,'New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822');
INSERT INTO fournisseurs VALUES(3,'Grandma Kelly''s Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735');
INSERT INTO fournisseurs VALUES(4,'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011');
INSERT INTO fournisseurs VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain','(98) 598 76 54');
INSERT INTO fournisseurs VALUES(6,'Mayumi''s','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan','(06) 431-7877');
INSERT INTO fournisseurs VALUES(7,'Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia','(03) 444-2343');
INSERT INTO fournisseurs VALUES(8,'Specialty Biscuits, Ltd.','Peter Wilson','29 King''s Way','Manchester','M14 GSD','UK','(161) 555-4448');
INSERT INTO fournisseurs VALUES(9,'PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Göteborg','S-345 67','Sweden','031-987 65 43');
INSERT INTO fournisseurs VALUES(10,'Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','São Paulo','5442','Brazil','(11) 555 4640');
INSERT INTO fournisseurs VALUES(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany','(010) 9984510');
INSERT INTO fournisseurs VALUES(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany','(069) 992755');
INSERT INTO fournisseurs VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany','(04721) 8713');
INSERT INTO fournisseurs VALUES(14,'Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy','(0544) 60323');
INSERT INTO fournisseurs VALUES(15,'Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway','(0)2-953010');
INSERT INTO fournisseurs VALUES(16,'Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA','(503) 555-9931');
INSERT INTO fournisseurs VALUES(17,'Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden','08-123 45 67');
INSERT INTO fournisseurs VALUES(18,'Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France','(1) 03.83.00.68');
INSERT INTO fournisseurs VALUES(19,'New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','2134','USA','(617) 555-3267');
INSERT INTO fournisseurs VALUES(20,'Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','512','Singapore','555-8787');
INSERT INTO fournisseurs VALUES(21,'Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark','43844108');
INSERT INTO fournisseurs VALUES(22,'Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands','(12345) 1212');
INSERT INTO fournisseurs VALUES(23,'Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland','(953) 10956');
INSERT INTO fournisseurs VALUES(24,'G''day, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunter''s Hill','Sydney','2042','Australia','(02) 555-5914');
INSERT INTO fournisseurs VALUES(25,'Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-9022');
INSERT INTO fournisseurs VALUES(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy','(089) 6547665');
INSERT INTO fournisseurs VALUES(27,'Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France','85.57.00.07');
INSERT INTO fournisseurs VALUES(28,'Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France','38.76.98.06');
INSERT INTO fournisseurs VALUES(29,'Forêts d''érables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955');

load data infile "/data/geo/pays.csv"
ignore into table pays columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/at.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/au.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/be.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/bl.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/ch.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/de.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/dk.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/es.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/fi.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/fr.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/gb.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/hr.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/hu.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/it.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/jp.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/lt.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/lu.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/nl.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/pl.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/pt.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/se.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/ua.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/regions/us.csv"
ignore into table regions columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_langues.csv"
ignore into table langues columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_pays_langues.csv"
ignore into table pays_langues columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_devises.csv"
ignore into table devises columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_banques.csv"
ignore into table banques columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind/shippers.csv"
ignore into table shippers columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_marque.csv"
ignore into table marques columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_customers.csv"
ignore into table customers columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_products.csv"
ignore into table products columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/northwind_orders.csv"
ignore into table orders columns terminated by ',' optionally enclosed by '"' ignore 1 lines;
