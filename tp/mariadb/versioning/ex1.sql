CREATE TABLE IF NOT EXISTS articles (
  article CHAR(50) NOT NULL,
  prix decimal NOT NULL,
  PRIMARY KEY (article)
) WITH SYSTEM VERSIONING;

 
SET @@timestamp = UNIX_TIMESTAMP('2023-09-10');
INSERT INTO articles VALUES('A', 10);

SET @@timestamp = UNIX_TIMESTAMP('2023-09-15');
INSERT INTO articles VALUES('B', 20);

SET @@timestamp = UNIX_TIMESTAMP('2023-09-20');
UPDATE articles SET prix = 12 WHERE article = 'A';

SET @@timestamp = UNIX_TIMESTAMP('2023-09-25');
UPDATE articles SET prix = 14 WHERE article = 'A';

SET @@timestamp = UNIX_TIMESTAMP('2023-09-30');
UPDATE articles SET prix = 18 WHERE article = 'B';

SET @@timestamp = UNIX_TIMESTAMP('2023-09-30');
DELETE FROM articles WHERE article_id = 1;

SET @@timestamp = UNIX_TIMESTAMP('2023-10-01');
UPDATE articles SET prix = 18 WHERE article = 'B';

select * FROM articles;

select * from articles 
  FOR SYSTEM_TIME AS OF TIMESTAMP'2023-09-21 08:00:00';

select * from articles 
  FOR SYSTEM_TIME FROM '2023-09-01 00:00:00' TO '2023-09-30 00:00:00';

select * from articles 
  FOR SYSTEM_TIME BETWEEN '2023-09-01 00:00:00' AND '2023-09-30 00:00:00';

select * from articles 
  FOR SYSTEM_TIME BETWEEN (NOW() - INTERVAL 1 YEAR) AND NOW();

select *, row_start, row_end 
  FROM articles FOR SYSTEM_TIME ALL;
