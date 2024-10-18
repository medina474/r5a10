select ST_Distance(b.coordonnees,
(select a.coordonnees from aeroports a where a.aeroport_code_icao  = 'TFFJ')) * 111.131
from aeroports b where b.aeroport_code_icao = 'TNCM';