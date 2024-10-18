use ventdest;

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


load data infile "/data/ventdest/clients.csv"
ignore into table tiers columns terminated by ',' optionally enclosed by '"' ignore 1 lines;


load data infile "/data/geo/regions.csv"
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

load data infile "/data/ventdest_langues.csv"
ignore into table langues columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest_pays_langues.csv"
ignore into table pays_langues columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest_devises.csv"
ignore into table devises columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/banques.csv"
ignore into table banques columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/shippers.csv"
ignore into table shippers columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/marque.csv"
ignore into table marques columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/clients.csv"
ignore into table tiers columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/products.csv"
ignore into table products columns terminated by ',' optionally enclosed by '"' ignore 1 lines;

load data infile "/data/ventdest/orders.csv"
ignore into table orders columns terminated by ',' optionally enclosed by '"' ignore 1 lines;
