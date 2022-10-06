CREATE SCHEMA IF NOT EXISTS transport;

CREATE TABLE transport.Cities
(
    "region"    varchar,
    "city_name" varchar,
    primary key ("region", "city_name")
);

CREATE TABLE transport.Stations
(
    "name"        varchar primary key,
    "#tracks"    int,
    "city_name"   varchar,
    "city_region" varchar,
    foreign key ("city_region", "city_name") references transport.Cities
);

CREATE TABLE transport.Trains (
  "trainNR" SERIAL PRIMARY KEY,
  "length" int,
  "start_station_id" varchar,
  "end_station_id" varchar
);

CREATE TABLE transport.Connected (
  "trainNR" int,
  "from_station_id" varchar,
  "to_station_id" varchar,
  "departure" timestamp,
  "arrival" timestamp
);

ALTER TABLE transport.Trains ADD FOREIGN KEY ("start_station_id") REFERENCES transport.Stations ("name");

ALTER TABLE transport.Trains ADD FOREIGN KEY ("end_station_id") REFERENCES transport.Stations ("name");

ALTER TABLE transport.Connected ADD FOREIGN KEY ("trainNR") REFERENCES transport.Trains ("trainNR");

ALTER TABLE transport.Connected ADD FOREIGN KEY ("from_station_id") REFERENCES transport.Stations ("name");

ALTER TABLE transport.Connected ADD FOREIGN KEY ("to_station_id") REFERENCES transport.Stations ("name");



