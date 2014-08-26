theo = Contact.create(name: "Theo", email: "theo@me.com")
mike = Contact.create(name: "Mike", email: "mike@me.com")

theo_address = Address.create(contact_id: 1, street: "Broadway", city: "Chicago", state: "IL", zip: 60666)
mike_address = Address.create(contact_id: 2, street: "Clark", city: "Chicago", state: "IL", zip: 60777)
