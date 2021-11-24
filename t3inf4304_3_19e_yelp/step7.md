Die letzte Tabellen-Art, die noch übrig bleibt, ist die Sat-Tabelle.

Hier werden zusätzliche oder historische Daten gespeichert. Eine Sat-Tabelle ist genau an einen Hub oder einen Link gebunden. Ein Hub oder Link müssen aber keine Sat-Tabellen besitzen. 

Streicht man in der Rohdaten-Tabellen-Übersicht nun alle bereits verwendeten Attribute, bleiben folgende übrig:

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

Eine Sat-Tabelle stehen durch einen oder mehreren Fremdschlüsselen mit der jeweiligen Link- oder Hub-Tabelle in Beziehung [1].

Nun können aus den Attributen einzelne Sat-Tabellen erstellt werden.