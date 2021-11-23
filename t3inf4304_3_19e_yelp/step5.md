Nun werden die Links, die Verbindungen zwischen Hubs, gesucht.

Im vorherigen Schritt wurde bereits `Review` ausgeschlossen, da es zusätzlich die Primärschlüssel von `User` und `Business` enthält. Daher kann `Review` in die Link-Liste aufgenommen werden.

Weitere Tabellen mit mehreren Fremdschlüssel sind `User_Friends` und `Tip`. Diese werden auch in die Liste übernommen.

- review(review_id, business_id, user_id, stars, useful, funny, cool, review_text, review_date)
- user_friends(user_id, friend_id)
- tip(user_id, business_id, tip_text, tip_date, compliment_count)

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