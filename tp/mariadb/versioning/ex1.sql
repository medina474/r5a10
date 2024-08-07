CREATE TABLE IF NOT EXISTS articles (
  article_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  article CHAR(50) NOT NULL,
  prix decimal NOT NULL,
  PRIMARY KEY (article_id)
) WITH SYSTEM VERSIONING;

 
SET @@timestamp = UNIX_TIMESTAMP('2023-09-10');
INSERT INTO articles (article, prix) VALUES('A', 10);

SET @@timestamp = UNIX_TIMESTAMP('2023-09-15');
INSERT INTO articles (article, prix) VALUES('B', 20);

SET @@timestamp = UNIX_TIMESTAMP('2023-09-20');
UPDATE articles SET prix = 12 WHERE article_id = 1;

SET @@timestamp = UNIX_TIMESTAMP('2023-09-25');
UPDATE articles SET prix = 14 WHERE article_id = 1;

SET @@timestamp = UNIX_TIMESTAMP('2023-09-30');
UPDATE articles SET prix = 18 WHERE article_id = 2;

SET @@timestamp = UNIX_TIMESTAMP('2023-09-30');
DELETE FROM articles WHERE article_id = 1;
