#!/usr/bin/bash

docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data phillopp/t3inf4303_3_19e_yelp:latest

sleep 5s

docker exec -it yelp_data bash
psql

\i /usr/src/assets/init.sql
\i /usr/src/assets/create-staging.sql

COPY staging.business FROM '/usr/src/assets/business.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_attributes FROM '/usr/src/assets/business_attributes.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_hours FROM '/usr/src/assets/business_hours.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_categories FROM '/usr/src/assets/business_categories.csv' DELIMITER ',' CSV HEADER;
COPY staging.checkin FROM '/usr/src/assets/checkin.csv' DELIMITER ',' CSV HEADER;
COPY staging.review FROM '/usr/src/assets/review.csv' DELIMITER ',' CSV HEADER;
COPY staging.tip FROM '/usr/src/assets/tip.csv' DELIMITER ',' CSV HEADER;
COPY staging.user FROM '/usr/src/assets/user.csv' DELIMITER ',' CSV HEADER;
COPY staging.user_elite FROM '/usr/src/assets/user_elite.csv' DELIMITER ',' CSV HEADER;