Im letzten Schritt für dieses Tutorial werden die Daten der letzten Sat-Tabelle `sat_review` und `sat_tip` geladen.

```
INSERT INTO vault.sat_review (review_id, stars, useful, funny, cool, review_text)
    SELECT review_id, stars, usefuk, funny, cool, review_text
    FROM staging.review
    WHERE review_id IN (SELECT id FROM vault.link_review);

INSERT INTO vault.sat_tip (business_id, user_id, tip_text, tip_date, compliment_count)
    SELECT business_id, user_id, tip_text, tip_date, compliment_count
    FROM staging.tip
    WHERE user_id IN (SELECT id FROM vault.hub_user)
    AND business_id IN (SELECT id FROM vault.hub_business);
```{{execute T1}}

Nun wurden alle Daten als Data Vault abgespeichert.