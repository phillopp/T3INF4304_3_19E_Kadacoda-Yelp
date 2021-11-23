Zum Schluss müssen die Daten in die Vault-Tabellen geladen werden.

```
INSERT INTO vault.hub_business (id)
    SELECT business_id
    FROM staging.business;
```{{execute T1}}