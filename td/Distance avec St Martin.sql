select b.coordonnees <->
(select a.coordonnees from aeroports a where a.aeroport_code_icao  = 'TFFJ')
from aeroports b where b.aeroport_code_icao = 'TNCM';

