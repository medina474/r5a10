-- select scheduled_departure, departure_time, departure_delay,
-- taxi_out,wheels_off,air_time ,wheels_on, 
-- taxi_in, arrival_time,  scheduled_arrival, arrival_delay,
-- * from vols_tmp v 
-- where v."month" = 1 and v."day" = 1 and v.flight_number = 1057 and airline = 'AA'

-- select heure_prevue_depart at time zone fuseau_horaire_origine, 
-- heure_depart at time zone fuseau_horaire_origine as heure_depart , 
-- delais_depart,
-- roulage_depart,
-- decollage at time zone fuseau_horaire_origine as decollage , 
-- duree_vol,
-- atterrissage at time zone fuseau_horaire_destination as atterrissage , 
-- roulage_arrivee , heure_arrivee at time zone fuseau_horaire_destination,
-- heure_prevue_arrivee at time zone fuseau_horaire_destination,
-- delais_arrivee,
-- * from vols v 
-- where v.jour = '2015-01-01' and v.vol_numero = 1057 and operateur_code_iata = 'AA'
