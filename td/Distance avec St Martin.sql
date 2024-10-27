select b.coordonnees <->
(select a.coordonnees from aviation.aeroports a where a.aeroport_code_icao  = 'TFFJ')
from aviation.aeroports b where b.aeroport_code_icao = 'TNCM';
