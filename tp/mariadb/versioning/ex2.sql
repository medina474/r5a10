CREATE OR REPLACE TABLE rooms (
  room_number INT,
  guest_name VARCHAR(255),
  arrivee DATE,
  depart DATE,
  PERIOD FOR p(checkin,checkout),
  UNIQUE (room_number, p WITHOUT OVERLAPS)
 );

INSERT INTO rooms VALUES (1, 'Regina', '2020-10-01', '2020-10-03');
INSERT INTO rooms VALUES (2, 'Cochise', '2020-10-02', '2020-10-05');
INSERT INTO rooms VALUES (1, 'Nowell', '2020-10-03', '2020-10-07');
INSERT INTO rooms VALUES (2, 'Eusebius', '2020-10-04', '2020-10-06');
