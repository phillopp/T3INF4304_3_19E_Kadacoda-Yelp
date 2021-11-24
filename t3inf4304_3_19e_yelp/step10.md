Die Rohdaten-Tabellen für `Review` und  `Tip` haben folgende nicht abgebildete Attribute:

- review(~~review_id, business_id, user_id,~~ stars, useful, funny, cool, review_text, review_date)
- tip(~~user_id, business_id,~~ tip_text, tip_date, compliment_count)

Diese als Sat-Tabelle sehen wie folgt aus:

```
CREATE TABLE vault.sat_review (
    business_id character(22),
    user_id character varying(30),
    load_date timestamp default current_timestamp,
    record_source integer,
    user_name character varying(200),
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
```{{execute T1}}