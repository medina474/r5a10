use northwind;

set character_set_client='utf8';
set character_set_connection='utf8';
set character_set_database='utf8';
set character_set_results='utf8';
set character_set_server='utf8';

insert into categories values 
  (1, 'Boissons', 'Boissons gazeuses, cafés, thés, bières et ales'),
  (2, 'Condiments', 'Sauces sucrées et salées, relishs, tartinades et assaisonnements'),
  (3, 'Confiseries', 'Desserts, bonbons et biscuits'),
  (4, 'Produits laitiers', 'Fromages'),
  (5, 'Grains/Céréales', 'Pains, craquelins, pâtes et céréales'),
  (6, 'Viande/Volaille', 'Charcuteries'),
  (7, 'Épicerie', 'Fruits secs et tofu'),
  (8, 'Poissonerie', 'Poissons et fruits de mer'),
  (9, 'Traiteur', 'Gratins');
