In der folgenden Liste sind alle Attribute aufgelistet, die noch nicht durch die Hub-Tabelle abgebildet worden sind.

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)

Um eine passende Verlinkung von Hub- und Sat-Tabellen zu haben, müssen die Sat-Tabellen den Primär-Schlüssel der Hub-Tabelle als Fremdschlüssel speichern. Als Primärschlüssel wird die Kombination des Fremdschlüssels und des Lade Datums genutzt.

Im Ressource-Feld wird die Herkunft der Daten gespeichert.

```
CREATE TABLE vault.sat_business (
    business_id character varying(25),
    load_date timestamp default current_timestamp,
    ressource integer,
    name character varying(200),
    address character varying(500),
    city character varying(200),
    state character varying(200),
    postal_code character varying(200),
    latitude float,
    longitude float,
    stars real,
    review_count integer,
    is_open boolean,
    PRIMARY KEY (business_id, load_date)
);

CREATE TABLE vault.sat_business_hours (
    business_id character varying(25),
    load_date timestamp default current_timestamp,
    ressource integer,
    weekday character varying(10),
    opening_hours character varying(100),
    PRIMARY KEY (business_id, load_date, weekday)
);

CREATE TABLE vault.sat_business_attributes (
    business_id character varying(25),
    load_date timestamp default current_timestamp,
    ressource integer,
    attribute character varying(200),
    value character varying(200),
    PRIMARY KEY (business_id, load_date, attribute)
);

CREATE TABLE vault.sat_business_categories (
    business_id character varying(25),
    load_date timestamp default current_timestamp,
    ressource integer,
    category character varying(100),
    PRIMARY KEY (business_id, load_date, category),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.sat_business_checkin (
    business_id character varying(25),
    load_date timestamp default current_timestamp,
    ressource integer,
    checkin_date date,
    PRIMARY KEY (business_id, load_date, checkin_date),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);
```{{execute T1}}