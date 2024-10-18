\c ventdest

select '=============== DEBUT DES CLÉS PRIMAIRES' as msg;

alter table fake.pyramide 
  add primary key (annee,sexe);

alter table fake.noms 
  add primary key (pays,nom);
