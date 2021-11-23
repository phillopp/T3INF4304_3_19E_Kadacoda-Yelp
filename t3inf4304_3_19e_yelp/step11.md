Zum Schluss müssen die Daten in die Vault-Tabellen geladen werden.

Zuerst werden die Daten in die Hub-Tabellen geladen.

```
INSERT INTO vault.hub_business (id)
    SELECT business_id
    FROM staging.business;

INSERT INTO vault.hub_user (id)
    SELECT user_id
    FROM staging.user;
```{{execute T1}}

Als nächstes werden die 