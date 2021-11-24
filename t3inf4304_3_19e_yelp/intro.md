# Data Warehouse

**Aufgabe:** Data Vault für Yelp-Daten.

**Vorbereitung:** Basiert auf dem Docker-Container 'abuckenhofer/columnarpostgresql'. Die Daten des Yelp-Datensets wurden in die 3. Normalform umgewandelt. Veränderungen gab es dadurch vor allem bei den Tabellen Business und User.

In der originalen Business-Daten-Datei wurden Attribute, Kategorien und Öffnungszeiten mehrmals für ein Business angegeben. Diese wurden in separate Dateien mit der jeweiligen Business ID gespeichert. Ähnlich hat es sich mit den User-Daten verhalten: Freunde und die Elite-Jahre wurden mit der User ID in einer separate Datei gespeichert.