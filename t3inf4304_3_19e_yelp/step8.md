Zuerst werden die Sat-Tabellen zum Hub `hub_business` erstellt. In der folgenden Liste sind alle Attribute und Rohdaten-Tabellen aufgelistet, die noch nicht durch die Hub-Tabelle oder einer anderen Tabelle abgebildet worden sind und eine Verbindung zur `staging.business`-Tabelle haben.

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)

Wie im vorherigen Schritt erwähnt, besitzen Sat-Tabellen die Primärschlüssel ihrer zugehörogen Hub- oder Link-Tabelle als Fremdschlüssel. Der Primärschlüssel der Sat-Tabelle setzt sich aus den Fremdschlüssel und dem Ladedatum zusammen.

```
CREATE TABLE vault.sat_business (
    business_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
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
    business_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    weekday character varying(10),
    opening_hours character varying(100),
    PRIMARY KEY (business_id, load_date, weekday)
);

CREATE TABLE vault.sat_business_attributes (
    business_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    attribute character varying(200),
    value character varying(200),
    PRIMARY KEY (business_id, load_date, attribute)
);

CREATE TABLE vault.sat_business_categories (
    business_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    category character varying(100),
    PRIMARY KEY (business_id, load_date, category),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.sat_business_checkin (
    business_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    checkin_date date,
    PRIMARY KEY (business_id, load_date, checkin_date),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);
```{{execute T1}}