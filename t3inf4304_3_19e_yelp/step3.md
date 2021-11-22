Nachdem im vorherigen Schritt kurz eingeleitet wurde, um was es sich bei einer Hub-Tabelle handelt, werden in diesem Schritt die Hub-Tabelle identifiziert und im nächsten Schritt erstellt.

Schaut man in den 10 verfügbaren Tabellen, welche einen eigenen Primärschlüssel haben, bleiben folgende drei übrig:

- Business
- Review
- User

Jedoch hat die Review-Tabelle zu ihrem eigenen Primärschlüssel zwei Fremdschlüssel zu Business und User. Daher fällt sie als Hub-Kandidat raus.

In einer Hub-Tabelle werden nur eindeutige Daten gespeichert, die sich nicht ändern. Dadurch fallen die anderen beiden Tabellen nicht raus. Es werden lediglich diese Attribute übernommen.

---

Alle Staging-Tabellen im Überblick:

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