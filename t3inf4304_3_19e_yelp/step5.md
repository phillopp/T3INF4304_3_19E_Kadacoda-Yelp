Als nächstes können die Link gesucht werden.

Da Links die Verbindung zwischen Hubs sind, müssen also alle Staging-Tabellen mit mindestens zwei Fremdschlüsseln gesucht werden, da Link-Tabellen immer m:n-Beziehungen darstellen [1]. Hier findet man folgende Tabellen:

- Review
- User Friends
- Tip

Im nächsten Schritt werden die entsprechenden Tabellen erstellt.

---

Alle Staging-Tabellen im Überblick:

- business(~~business_id,~~ name, address, city, state, postal_code, latitude, longitude, stars, review_count, is_open)
- business_hours(business_id, weekday, opening_hours)
- business_attributes(business_id, attribute, value)
- business_categories(business_id, category)
- checking(business_id, checkin)
- review(review_id, business_id, user_id, stars, useful, funny, cool, review_text, review_date)
- tip(user_id, business_id, tip_text, tip_date, compliment_count)
- user(~~user_id,~~ user_name, review_count, yelping_since, useful, funny, cool, friends)
- user_friends(user_id, friend_id)
- user_elite(user_id, elite_year)