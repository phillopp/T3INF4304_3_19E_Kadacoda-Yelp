Nach dem nun die Hub- und Link-Tabellen erstellt worden sind, fehlen noch die Sat-Tabellen. Sat-Tabellen enthalten alle zusätzliche Informationen, die nicht in Hub- oder Link-Tabellen angezeigt werden.

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(~~review_id, business_id, user_id,~~ stars, useful, funny, cool, review_text, review_date)
- tip(~~user_id, business_id,~~ tip_text, tip_date, compliment_count)
- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(~~user_id, friend_id~~)
- user_elite(user_id, elite_year)

In den folgenden Schritten werden für die jeweiligen Hubs und Links die Sat-Tabellen erstellt und die jeweiligen Daten aus den Staging-Tabellen in die Data Vault Tabellen geladen.


---

Alle Staging-Tabellen im Überblick:

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(~~review_id, business_id, user_id,~~ stars, useful, funny, cool, review_text, review_date)
- tip(~~user_id, business_id,~~ tip_text, tip_date, compliment_count)
- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(~~user_id, friend_id~~)
- user_elite(user_id, elite_year)