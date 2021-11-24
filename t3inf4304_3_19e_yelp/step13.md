Sat-Tabellen Business

```
INSERT INTO vault.sat_business (business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
    SELECT business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open
    FROM staging.business
    WHERE business_id IN (SELECT id FROM vault.hub_business);

INSERT INTO vault.sat_business_hours (business_id, weekday, opening_hours)
    SELECT business_id, weekday, opening_hours
    FROM staging.business_hours
    WHERE business_id IN (SELECT id FROM vault.hub_business);

INSERT INTO vault.sat_business_attributes (business_id, attribute, value)
    SELECT business_id, attribute, value
    FROM staging.business_attributes
    WHERE business_id IN (SELECT id FROM vault.hub_business);

INSERT INTO vault.sat_business_categories (business_id, category)
    SELECT business_id, category
    FROM staging.business_categories
    WHERE business_id IN (SELECT id FROM vault.hub_business);

INSERT INTO vault.sat_business_checkin (business_id, checkin_date)
    SELECT business_id, checkin_date
    FROM staging.checkin
    WHERE business_id IN (SELECT id FROM vault.hub_business);
```{{execute T1}}