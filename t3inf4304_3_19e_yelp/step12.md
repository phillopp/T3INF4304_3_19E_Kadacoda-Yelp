Nachdem die Hub-Tabellen beladen wurden, sind die Link-Tabellen an der Reihe.

Im SQL-Befehl erfolgt die Beladung nur mit Datensätzen, die in die Hub-Tabelle geladen wurden. Dadurch werden Constraint-Probleme umgangen, da es sich hier nicht um das komplette Datenset handelt.

```
INSERT INTO vault.link_review (id, business_id, user_id)
    SELECT review_id, business_id, user_id
    FROM staging.review
    WHERE business_id IN (SELECT id FROM vault.hub_business)
    AND user_id IN (SELECT id FROM vault.hub_user);

INSERT INTO vault.link_user_friends (user_id, friend_id)
    SELECT user_id, friend_id
    FROM staging.user_friends
    WHERE user_id IN (SELECT id FROM vault.hub_user)
    AND friend_id IN (SELECT id FROM vault.hub_user);

INSERT INTO vault.link_tip (business_id, user_id)
    SELECT business_id, user_id
    FROM staging.tip
    WHERE user_id IN (SELECT id FROM vault.hub_user)
    AND business_id IN (SELECT id FROM vault.hub_business)
ON CONFLICT DO NOTHING;
```{{execute T1}}