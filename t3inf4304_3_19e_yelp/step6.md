Auch hier müssen aus den Staging-Tabellen die überflüssen Informationen gestrichen werden.

- review(review_id, business_id, user_id~~, stars, useful, funny, cool, review_text, review_date~~)
- user_friends(user_id, friend_id)
- tip(user_id, business_id~~, tip_text, tip_date, compliment_count~~)

```
CREATE TABLE vault.link_review (
    id character varying(30),
    business_id character varying(25),
    user_id character varying(30),
    load_date timestamp,
    PRIMARY KEY (id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.business(id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.user(id)
);

CREATE TABLE vault.link_user_friends (
    user_id character varying(30),
    friend_id character varying(30),
    load_date timestamp,
    PRIMARY KEY (user_id, friend_id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.user(id),
    CONSTRAINT fk_friend_id
        FOREIGN KEY(friend_id) 
        REFERENCES vault.user(id)
);

CREATE TABLE vault.link_review (
    business_id character varying(25),
    user_id character varying(30),
    load_date timestamp,
    PRIMARY KEY (business_id, user_id),
    CONSTRAINT fk_business_id
        FOREIGN KEY(business_id) 
        REFERENCES vault.business(id),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.user(id)
);
```{{execute T1}}