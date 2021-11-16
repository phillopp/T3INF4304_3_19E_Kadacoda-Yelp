import json, csv

print("################")
print("# Businessdata #")
print("################")
print("")

with open("/usr/src/yelp_academic_dataset_business.json", "r") as read_file:
    with open('business.csv', 'w', newline='') as business_csv:
        with open('business_hours.csv', 'w',newline='') as business_hours_csv:
            spamwriter = csv.writer(business_csv, delimiter=',')
            spamwriter.writerow(["business_id","name","address","city","state","postal_code","latitude","longitude","stars","review_count","is_open","categories"])

            hours_writer = csv.writer(business_hours_csv, delimiter=',')
            hours_writer.writerow(["business_id", "weekday", "opening_hours"])

            print("JSON-Datei eingelesen")
            businesses = [json.loads(line) for line in read_file]
            print(str(len(businesses))+"Elemente gefunden.")

            for test in businesses:
                spamwriter.writerow([test["business_id"], test["name"], test["address"], test["city"], test["state"], test["postal_code"],test["latitude"],test["longitude"],test["stars"],test["review_count"],test["is_open"],test["categories"]])
                for weekday, hours in test["hours"]:
                    hours_writer.writerow([test["business_id"], weekday, hours])

                print(test["business_id"])
                print("")
            print("Businessdaten fertig geladen.")
            business_hours_csv.close()
        business_csv.close()
    read_file.close()