CREATE SCHEMA IF NOT EXISTS medi;


CREATE TABLE medi.Stations (
  "stat_nr" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE medi.Rooms (
  "room_nr" SERIAL PRIMARY KEY,
  "stat_nr" int,
  "#beds" int
);

CREATE TABLE medi.StationPersonells (
  "pers_nr" SERIAL PRIMARY KEY,
  "#name" varchar,
  "stat_nr" int
);

CREATE TABLE medi.Caregivers (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE medi.Doctors (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE medi.Patients (
  "patient_nr" SERIAL PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "room_nr" int,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE medi.Treats (
  "pers_nr" int,
  "patient_nr" int
);

ALTER TABLE medi.Rooms ADD FOREIGN KEY ("stat_nr") REFERENCES medi.Stations ("stat_nr");

ALTER TABLE medi.StationPersonells ADD FOREIGN KEY ("stat_nr") REFERENCES medi.Stations ("stat_nr");

ALTER TABLE medi.StationPersonells ADD FOREIGN KEY ("pers_nr") REFERENCES medi.Caregivers ("pers_nr");

ALTER TABLE medi.StationPersonells ADD FOREIGN KEY ("pers_nr") REFERENCES medi.Doctors ("pers_nr");

ALTER TABLE medi.Treats ADD FOREIGN KEY ("pers_nr") REFERENCES medi.Doctors ("pers_nr");

ALTER TABLE medi.Treats ADD FOREIGN KEY ("patient_nr") REFERENCES medi.Patients ("patient_nr");

ALTER TABLE medi.Patients ADD FOREIGN KEY ("room_nr") REFERENCES medi.Rooms ("room_nr");
