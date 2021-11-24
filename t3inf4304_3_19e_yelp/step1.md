Zu aller erst, muss die Kommandozeile für Postgres geöffnet werden. Dies sollte eigentlich automatisch geschenen. Sollte das Terminal nicht `postgres=#` anzeigen, muss der Befehl `psql` ausgeführt werden.

Im ersten Schritt werden zwei Schemata angelegt. Das erst ist `staging`, in dem die Tabellen der Rohdaten abgelegt werden. Im Schema `vault` werden die Tabellen im Data Vault Format abgelegt.

```
CREATE SCHEMA staging;
CREATE SCHEMA vault;
```{{execute T1}}

Wenn die Schemata erfolgreich angelegt wurden, gibt das Terminal jeweils `CREATE SCHEMA` aus.

Als nächstes müssen die Tabellen für die Rohdaten angelegt werden. Die Datentypen für die jeweiligen Daten angeschaut und passende ausgewählt.

```
CREATE TABLE staging.business (
        business_id character(22),
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

CREATE TABLE staging.business_hours (
    business_id character(22),
    weekday character varying(10),
    opening_hours character varying(100)
);

CREATE TABLE staging.business_attributes(
    business_id character(22),
    attribute character varying(200),
    value character varying(200)
);

CREATE TABLE staging.business_categories (
    business_id character(22),
    category character varying(100)
);

CREATE TABLE staging.checkin(
    business_id character(22),
    checkin_date date
); 

CREATE TABLE staging.review(
    review_id character(22),
    business_id character(22),
    user_id character(22),
    starts integer,
    useful integer,
    funny integer,
    cool integer,
    review_text text,
    review_date date
);

CREATE TABLE staging.tip(
    user_id character(22),
    business_id character(22),
    tip_text text,
    tip_date date,
    compliment_count integer
);

CREATE TABLE staging.user(
    user_id character(22),
    user_name character varying(200),
    review_count integer,
    yelping_since timestamp,
    useful integer,
    funny integer,
    cool integer
);

CREATE TABLE staging.user_elite(
    user_id character(22),
    elite_year character varying(4)
);

CREATE TABLE staging.user_friends(
    user_id character(22),
    friend_id character(22)
);
```{{execute T1}}

Der letzte Schritt mit den Rohdaten ist nun, diese in die eben angelegten Tabellen zu kopieren. Da die Daten vorab als CSV-Dateien angelgt wurden, können diese mit einem Postgres Internen Befehl einfach in die Tabellen gespeichert werden.

```
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
```{{execute T1}}

Ist der Befehl erfolgreich ausgeführt worden, gibt die Kommandozeile `COPY [Anzahl Datensätze]` aus.