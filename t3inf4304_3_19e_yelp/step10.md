Auch die Link-Tabellen `Review`und `Tip` haben weitere Attribute, die in eine Sat-Tabelle ausgelagert werden müssen.

- review(~~review_id, business_id, user_id,~~ stars, useful, funny, cool, review_text, review_date)
- tip(~~user_id, business_id,~~ tip_text, tip_date, compliment_count)

```
CREATE TABLE vault.sat_review (
    business_id character varing(25),
    user_id character varying(30),
    load_date timestamp,
    ressource integer,
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
    business_id character varying(25),
    user_id character varing(30),
    load_date timestamp,
    ressource integer,
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