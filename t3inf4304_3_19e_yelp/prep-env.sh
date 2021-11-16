#!/usr/bin/bash
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data -v /root:/usr/src/assets abuckenhofer/columnarpostgresql:latest
docker exec -it yelp_data bash


psql
\i /usr/src/assets/init.sql
\i /usr/src/assets/create-staging.sql