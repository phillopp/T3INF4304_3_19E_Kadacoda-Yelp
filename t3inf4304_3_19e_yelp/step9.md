Für die Hub-Tabelle `User` stehen noch folgende Staging-Tabellen und Attribute offen:

- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(~~user_id, friend_id~~)
- user_elite(user_id, elite_year)

Die `User_Friends` Tabelle ist mit der Erstellung der Link-Tabelle vollständig abgebildet und muss nicht durch eine Sat-Tabelle erweitert werden.

```
CREATE TABLE vault.sat_user (
    user character varying(30),
    load_date timestamp,
    ressource integer,
    user_name character varying(200),
    review_count integer,
    yelping_since timestamp,
    useful integer,
    funny integer,
    cool integer,
    PRIMARY KEY (user_id, load_date)
);

CREATE TABLE vault.sat_user_elite (
    business_id character varying(25),
    load_date timestamp,
    ressource integer,
    elite_year character varying(5),
    PRIMARY KEY (business_id, load_date)
);
```{{execute T1}}