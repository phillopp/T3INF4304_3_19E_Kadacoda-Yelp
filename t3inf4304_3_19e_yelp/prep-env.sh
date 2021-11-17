#!/usr/bin/bash
mkdir assets
cd assets
wget https://www.phillopp.de/dwh/business.csv
wget https://www.phillopp.de/dwh/business_hours.csv
wget https://www.phillopp.de/dwh/business_attributes.csv
wget https://www.phillopp.de/dwh/business_categories.csv
wget https://www.phillopp.de/dwh/checkin.csv
wget https://www.phillopp.de/dwh/review.csv
wget https://www.phillopp.de/dwh/tip.csv
wget https://www.phillopp.de/dwh/user.csv
wget https://www.phillopp.de/dwh/user_elite.csv
chmod -R 777 /root/assets/
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data -v /root:/usr/src/assets abuckenhofer/columnarpostgresql:latest

sleep 5s
docker exec -u root yelp_data chmod -R 777 /usr/src/assets

docker exec -it yelp_data bash
psql

\i /usr/src/assets/init.sql
\i /usr/src/assets/create-staging.sql

COPY staging.business FROM '/usr/src/assets/business.csv' DELIMITER ',' CSV HEADER;