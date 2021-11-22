Die Yelp-Daten befinden sich im Docker-Image unter `/usr/src/yelp_data/`.

Im ersten Schritt werden zwei Schemata angelegt. Das erst ist `staging`, in dem die Tabellen der Rohdaten abgelegt werden. Im Schema `vault` werden die Daten im Data Vault Format abgelegt.

```
CREATE SCHEMA staging;
CREATE SCHEMA vault;
```

Anschließend werden die einzelnen Tabellen der Rohdaten angelegt.

Der letzte Schritt für diese Seite ist das Laden der Yelp-Daten in die Tabelle. Dies erfolgt mittels CSV-Dateien und dem COPY-Befehl. Im folgenden ist der Befehl beispielhaft für die Business-Daten.

`COPY staging.business FROM '/usr/src/yelp_data/business.csv' DELIMITER ',' CSV HEADER;`