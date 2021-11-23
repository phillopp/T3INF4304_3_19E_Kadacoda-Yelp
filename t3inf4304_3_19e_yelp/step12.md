Im nächsten Schritt werden die Daten in die Link-Tabellen eingetragen.

Da es sich um Teile des kompletten Datensatzes handelt, wird beim Einfügen überprüft, ob der jeweilige Fremdschlüssel des Datensatzes in der Hub-Tabelle vorhanden ist. 

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