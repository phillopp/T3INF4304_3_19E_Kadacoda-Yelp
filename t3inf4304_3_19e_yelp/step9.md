Äquivalten zu den Sat-Tabellen zuvor, ist es mit den Sat-Tabellen für die Hub-Tabelle `user`.

- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_elite(user_id, elite_year)

Die `staging.user_friends`-Tabelle ist bereits durch ihre Link-Implementierung vollständig abgebildet worden. Dadurch erhält sie keine Sat-Tabelle.

Für die Sat-Tabellen sieht der SQL-Befehl wie folgt aus:

```
CREATE TABLE vault.sat_user (
    user_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    user_name character varying(200),
    review_count integer,
    yelping_since timestamp,
    useful integer,
    funny integer,
    cool integer,
    PRIMARY KEY (user_id, load_date),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id)
);

CREATE TABLE vault.sat_user_elite (
    user_id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    elite_year character varying(5),
    PRIMARY KEY (user_id, load_date),
    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id) 
        REFERENCES vault.hub_user(id)
);
```{{execute T1}}