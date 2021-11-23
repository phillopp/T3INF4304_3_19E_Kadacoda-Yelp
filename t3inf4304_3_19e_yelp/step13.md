Sat-Tabellen Business

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
```
INSERT INTO vault.sat_business (business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
    SELECT business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open
    FROM staging.business
    WHERE business_id IN (SELECT id FROM vault.hub_business);
```{{execute T1}}