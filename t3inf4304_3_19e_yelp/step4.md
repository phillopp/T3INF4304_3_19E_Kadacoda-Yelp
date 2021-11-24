In einer Hub-Tabelle werden nur eindeutige Attribute, die sich nicht verändern, gespeichert.

Betrachten wir nun die Rohdaten-Tabellen der künftigen Hub-Tabellen:

- business(business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- user(user_id, user_name, review_count, yelping_since, useful, funny, cool)

Wenn wir in den verfügbaren Attributen nun nach eindeutigen Daten suchen, fallen bis auf die jeweiligen IDs alle Felder weg.

Beispielsweise kann ein Geschäft (Business) eine neue Bewertung (Review) erhalten. Dadurch erhöht sich das Feld review_count, aber das Geschäft bleibt das gleiche.

Also können für die Hub-Tabellen alle Attribute bis auf die ID gestrichen werden. In jeder Tabelle werden die Attribute `load_date` und `record_source` angelegt. Darin wird gespeichert, wann die Daten aus welchem Quellsystem geladen wurden.

Der SQL-Befehl zur Erstellung der Hubs sieht wie folgt aus:

```
CREATE TABLE vault.hub_business (
    id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    PRIMARY KEY (id)
);

CREATE TABLE vault.hub_user (
    id character(22),
    load_date timestamp default current_timestamp,
    record_source integer,
    PRIMARY KEY (id)
);
```{{execute T1}}

Wenn die Tabellen erfolgreich erstellt wurden, gibt das Terminal `CREATE TABLE` aus.