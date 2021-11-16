#!/usr/bin/bash
mkdir assets
cd assets
wget https://github.com/phillopp/T3INF4304_3_19E_Katacoda-Yelp/raw/main/t3inf4304_3_19e_yelp/assets/business.csv
chmod -R 777 /root/assets/
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data -v /root:/usr/src/assets abuckenhofer/columnarpostgresql:latest
docker exec -it yelp_data psql

\i /usr/src/assets/init.sql
\i /usr/src/assets/create-staging.sql