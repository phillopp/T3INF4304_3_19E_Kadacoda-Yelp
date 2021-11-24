Auch hier müssen aus den Staging-Tabellen die überflüssen Informationen gestrichen werden.

- review(review_id, business_id, user_id~~, stars, useful, funny, cool, review_text, review_date~~)
- user_friends(user_id, friend_id)
- tip(user_id, business_id~~, tip_text, tip_date, compliment_count~~)

```
CREATE TABLE vault.link_review (
    id character(22),
    business_id character(22),
    user_id character varying(30),
    load_date timestamp default current_timestamp,
    PRIMARY KEY (id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_business(id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.link_user_friends (
    user_id character(22),
    friend_id character(22),
    load_date timestamp default current_timestamp,
    PRIMARY KEY (user_id, friend_id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id),
    CONSTRAINT fk_friend_id
        FOREIGN KEY(friend_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.link_tip (
    business_id character(22),
    user_id character(22),
    load_date timestamp default current_timestamp,
    PRIMARY KEY (business_id, user_id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_business(id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id)
);
```{{execute T1}}

---

Alle Staging-Tabellen im Überblick:

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(~~review_id, business_id, user_id,~~ stars, useful, funny, cool, review_text, review_date)
- tip(~~user_id, business_id,~~ tip_text, tip_date, compliment_count)
- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(~~user_id, friend_id~~)
- user_elite(user_id, elite_year)