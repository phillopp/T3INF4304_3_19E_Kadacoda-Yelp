Zum Schluss müssen die Daten aus den Rohdaten-Tabellen in die Vault-Tabellen geladen werden.

Da zuvor mit Beziehungen und Constraints gearbeitet wurden, müssen zuert die Hub-Tabellen beladen werden.

Der SQL-Befehl dafür sieht so aus:

```
INSERT INTO vault.hub_business (id)
    SELECT business_id
    FROM staging.business;

INSERT INTO vault.hub_user (id)
    SELECT user_id
    FROM staging.user;
```{{execute T1}}