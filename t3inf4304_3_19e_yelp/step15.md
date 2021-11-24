Im letzten Schritt für dieses Tutorial werden die Daten der letzten Sat-Tabelle `sat_review` und `sat_tip` geladen.

```
INSERT INTO vault.sat_review (business_id, user_id, )
```{{execute T1}}

CREATE TABLE vault.sat_review (
    business_id character(22),
    user_id character varying(30),
    load_date timestamp default current_timestamp,
    record_source integer,
    review_count integer,
    yelping_since timestamp,
    useful integer,
    funny integer,
    cool integer,
    PRIMARY KEY (business_id, user_id, load_date),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.sat_tip (
    business_id character(22),
    user_id character varying(30),
    load_date timestamp default current_timestamp,
    record_source integer,
    elite_year character varying(5),
    PRIMARY KEY (business_id, user_id, load_date),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_user(id)
);