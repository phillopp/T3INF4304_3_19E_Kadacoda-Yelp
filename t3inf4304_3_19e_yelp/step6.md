Ähnlich wie bei Hubs werden bei Links nur die eindeutigen Daten gespeichert. Konkret sind dies eventuelle eigene Primärschlüssel und die Fremdschlüssel der verbindenden Hubs:

- review(review_id, business_id, user_id, stars, useful, funny, cool, review_text, review_date)
- user_friends(user_id, friend_id)
- tip(user_id, business_id, tip_text, tip_date, compliment_count)

Die anderen Attribute werden gestrichen und es ergeben sich folgende Tabellen:

- review(review_id, business_id, user_id)
- user_friends(user_id, friend_id)
- tip(user_id, business_id)

```
CREATE TABLE vault.link_review (
    id character(22),
    business_id character(22),
    user_id character varying(30),
    load_date timestamp default current_timestamp,
    record_source integer,
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
    record_source integer,
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
    record_source integer,
    PRIMARY KEY (business_id, user_id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.hub_business(id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id)
);
```{{execute T1}}