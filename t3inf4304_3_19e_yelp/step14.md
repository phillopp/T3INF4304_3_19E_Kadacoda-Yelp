Nun werden die Daten für den Hub `user` gelesen.

![Land](https://www.dasoertliche.de/img/stage/Land2.jpg)

```
INSERT INTO vault.sat_business (business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
    SELECT business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open
    FROM staging.business
    WHERE business_id IN (SELECT id FROM vault.hub_business);
```{{execute T1}}