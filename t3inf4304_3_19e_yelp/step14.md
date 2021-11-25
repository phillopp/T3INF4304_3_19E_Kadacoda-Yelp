Nun werden die Daten für den Hub `user` in die Sat-Tabellen geladen.

```
INSERT INTO vault.sat_user (user_id, user_name, review_count, yelping_since, useful, funny, cool)
    SELECT user_id, user_name, review_count, yelping_since, useful, funny, cool
    FROM staging.user
    WHERE user_id IN (SELECT id FROM vault.hub_user);

INSERT INTO vault.sat_user_elite (user_id, elite_year)
    SELECT user_id, elite_year
    FROM staging.user_elite
    WHERE user_id IN (SELECT id FROM vault.hub_user)
ON CONFLICT DO NOTHING;
```{{execute T1}}