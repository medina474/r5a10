
---
title: System-Versioned Tables
---

MariaDB prend en charge les tables de données temporelles sous la forme de tables de **contrôle de version du système** (vous permettant d'interroger et d'opérer sur des données historiques, décrites ci-dessous), de **périodes d'application** (vous permettant d'interroger et d'opérer sur une plage temporelle de données) et de **tables bitemporelles** (qui combinent à la fois le contrôle de version du système et les périodes d'application).

## System-Versioned Tables

Les tables versionnées par le système stockent l'historique de toutes les modifications, pas seulement les données actuellement applicables. Cela permet d'analyser les données à tout moment, d'auditer les modifications et de comparer les données à différents moments. Les cas d'utilisation typiques sont :

Analyse médico-légale et exigences légales de stockage des données pendant N années.
Analyse des données (rétrospective, tendances, etc.), par exemple pour obtenir les informations sur votre personnel il y a un an.
Récupération à un moment précis : récupérez l'état d'une table à un moment précis.

Les tables versionnées par le système ont été introduites pour la première fois dans la norme SQL 2011.

Storing the History Separately

When the history is stored together with the current data, it increases the size of the table, so current data queries — table scans and index searches — will take more time, because they will need to skip over historical data. If most queries on that table use only current data, it might make sense to store the history separately, to reduce the overhead from versioning.

This is done by partitioning the table by SYSTEM_TIME. Because of the partition pruning optimization, all current data queries will only access one partition, the one that stores current data.

This example shows how to create such a partitioned table:

CREATE TABLE t (x INT) WITH SYSTEM VERSIONING
  PARTITION BY SYSTEM_TIME (
    PARTITION p_hist HISTORY,
    PARTITION p_cur CURRENT
  );


ERROR 1062 (23000): Duplicate entry '2-2020-10-06-2020-10-04' for key 'room_number'

Bitemporal tables are tables that use versioning both at the system and application-time period levels.
Contents

    Using Bitemporal Tables
    See Also 

### Using Bitemporal Tables

To create a bitemporal table, use:



Note that, while system_time here is also a time period, it cannot be used in DELETE FOR PORTION or UPDATE FOR PORTION statements.

DELETE FROM test.t3 
FOR PORTION OF system_time 
    FROM '2000-01-01' TO '2018-01-01';
ERROR 42000: You have an error in your SQL syntax; check the manual that corresponds 
  to your MariaDB server version for the right syntax to use near
  'of system_time from '2000-01-01' to '2018-01-01'' at line 1
