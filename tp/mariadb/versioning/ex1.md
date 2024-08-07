System-Versioned Tables

MariaDB prend en charge les tables de données temporelles sous la forme de tables de contrôle de version du système (vous permettant d'interroger et d'opérer sur des données historiques, décrites ci-dessous), de périodes d'application (vous permettant d'interroger et d'opérer sur une plage temporelle de données) et de tables bitemporelles (qui combinent à la fois le contrôle de version du système et les périodes d'application).

Tables versionnées par le système

Les tables versionnées par le système stockent l'historique de toutes les modifications, pas seulement les données actuellement applicables. Cela permet d'analyser les données à tout moment, d'auditer les modifications et de comparer les données à différents moments. Les cas d'utilisation typiques sont :

Analyse médico-légale et exigences légales de stockage des données pendant N années.
Analyse des données (rétrospective, tendances, etc.), par exemple pour obtenir les informations sur votre personnel il y a un an.
Récupération à un moment précis : récupérez l'état d'une table à un moment précis.

Les tables versionnées par le système ont été introduites pour la première fois dans la norme SQL : 2011.
