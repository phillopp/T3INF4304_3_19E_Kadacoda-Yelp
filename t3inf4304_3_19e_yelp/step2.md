Nach dem anlegen der Tabellen und laden der Daten, stehen folgende Tabellen zur Verfügung:

- business(business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(review_id, business_id, user_id, stars, useful, funny, cool, review_text, review_date)
- tip(user_id, business_id, tip_text, tip_date, compliment_count)
- user(user_id, user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(user_id, friend_id)
- user_elite(user_id, elite_year)



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