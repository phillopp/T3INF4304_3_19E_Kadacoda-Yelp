#!/usr/bin/bash

docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data phillopp/t3inf4303_3_19e_yelp:latest

sleep 5s

docker exec -it yelp_data bash
psql

\i /usr/src/assets/init.sql
\i /usr/src/assets/create-staging.sql

COPY staging.business FROM '/usr/src/yelp_data/business.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_attributes FROM '/usr/src/yelp_data/business_attributes.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_hours FROM '/usr/src/yelp_data/business_hours.csv' DELIMITER ',' CSV HEADER;
COPY staging.business_categories FROM '/usr/src/yelp_data/business_categories.csv' DELIMITER ',' CSV HEADER;
COPY staging.checkin FROM '/usr/src/yelp_data/checkin.csv' DELIMITER ',' CSV HEADER;
COPY staging.review FROM '/usr/src/yelp_data/review.csv' DELIMITER ',' CSV HEADER;
COPY staging.tip FROM '/usr/src/yelp_data/tip.csv' DELIMITER ',' CSV HEADER;
COPY staging.user FROM '/usr/src/yelp_data/user.csv' DELIMITER ',' CSV HEADER;
COPY staging.user_elite FROM '/usr/src/yelp_data/user_elite.csv' DELIMITER ',' CSV HEADER;
COPY staging.user_friends FROM '/usr/src/yelp_data/user_friends.csv' DELIMITER ',' CSV HEADER;