Nachdem die Tabellen erfolgreich angelegt wurden und einige Daten aus dem Yelp-Datensatz in diese Tabellen geladen wurde, ist die unten stehende Liste an Tabellen und den dahinterstehenden Attributen zur Verfügbar:

- business(business_id, name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(review_id, business_id, user_id, stars, useful, funny, cool, review_text, review_date)
- tip(user_id, business_id, tip_text, tip_date, compliment_count)
- user(user_id, user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(user_id, friend_id)
- user_elite(user_id, elite_year)

Um die Daten nun in ein Data Vault speichern zu können, müssen passende Tabellen dafür erstellt werden. In einem Data Vault stehen drei verschiedene Typen für die Tabellen zur Verfügung.

1. **Hub-Tabellen**: Stellen eindeutige Objekte mittels eines Business-Schlüssels dar. Er enthält keine Fremdschlüssel.
2. **Link-Tabellen**: Stellen die Verbindung zwischen Objekten dar.
3. **Sat-Tabellen**: Beinhalten zusätzliche Informationen zu Hub- oder Link-Tabellen. [1, 2]