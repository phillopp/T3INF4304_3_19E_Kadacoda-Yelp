Die Daten aus dem Yelp-Datensatz werden zuerst in die Datenbank geladen.

Hierzu muss für die einzelnen Daten Tabellen angelegt werden.

## Business Tabelle

```
CREATE TABLE staging.business (
        business_id character varying(25),
        name character varying(200),
        address character varying(500),
        city character varying(200),
        state character varying(200),
        postal_code character varying(200),
        latitude float,
        longitude float,
        stars real,
        review_count integer,
        is_open boolean
);
```{{execute T1}}

COPY staging.business FROM '/usr/src/assets/business.csv' DELIMITER ',' CSV HEADER;