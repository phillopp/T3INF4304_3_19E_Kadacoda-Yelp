#!/usr/bin/bash

# run in forground

docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name yelp_data -v /root/assets:/usr/src/assets abuckenhofer/columnarpostgresql:latest
docker exec -it yelp_data bash

apt-get update
apt-get install -y python3 python3-pip

psql

\i /usr/src/sql/init.sql
\i /usr/src/sql/create-staging.sql

exit;

python3 /usr/src/sql/load-data.py