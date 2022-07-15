puts "🙋‍♀️ Seeding customers... 🙋" 

Customer.create(name: "Terrence Jung", email_address: "terrencejung928@gmail.com", phone_number: "827-839-9022")
Customer.create(name: "Mark Reese", email_address: "marksreese@gmail.com", phone_number: "425-999-0937")
Customer.create(name: "Yifan Wu", email_address: "yifanwu@gmail.com", phone_number: "027-833-2799")
Customer.create(name: "Emiley Palmquist", email_address: "emileypalmquist@email", phone_number: "123-455-0928")
Customer.create(name: "Gordon Ramsay", email_address: "idiotsandwich@email.com", phone_number: "444-555-6666")
Customer.create(name: "Aysan Isayo", email_address: "aysanisayo@email.com", phone_number: "240-123-9876")
Customer.create(name: "Connie Park", email_address: "conniepark@email.com", phone_number: "345-237-4586")
Customer.create(name: "Erik Quintana", email_address: "erikquintana@email.com", phone_number: "658-873-3674")
Customer.create(name: "Harrison Sabean", email_address: "harrisonsabean@email.com", phone_number: "582-427-9874")
Customer.create(name: "Ikmann Bhullar", email_address: "ikmannbhullar@email.com", phone_number: "425-862-3858")
Customer.create(name: "Kiran Phillips", email_address: "kiranphillips@email.com", phone_number: "893-469-1865")
Customer.create(name: "Lior Levy", email_address: "liorlevy@email.com", phone_number: "941-683-2359")
Customer.create(name: "Lucas Sweeney", email_address: "sweens@email.com", phone_number: "357-438-1308")
Customer.create(name: "Samantha Navarro", email_address: "samnavarro@email.com", phone_number: "193-908-2134")
Customer.create(name: "Shane Dorsey", email_address: "shanedorsey@email.com", phone_number: "018-832-8562")
Customer.create(name: "Thomas Cook", email_address: "thomascook@email.com", phone_number: "549-138-5397")

puts "🍔 Seeding menu items... 🍝"

20.times do
    item_name = Faker::Food.unique.dish
    price = (rand(1..20) + rand()).truncate(2)
    inventory = rand(1..15)
    image = Faker::Internet.unique.url
    MenuItem.create(item_name: item_name , price: price , image: image , inventory: inventory)
end

MenuItem.create(item_name: "Stick of butter", price: 4.20, image: Faker::Internet.unique.url, inventory: 5)
MenuItem.create(item_name: "Wheel of cheese", price: 29.99, image: Faker::Internet.unique.url, inventory: 2)
MenuItem.create(item_name: "Glass of milk", price: 1.50, image: Faker::Internet.unique.url, inventory: 10)

puts "💰 Seeding orders... 💵" 

status_strings = ["Queued", "In-Progress"]
delivery_booleans = [true , false]

30.times do 
    Order.create( customer_id: Customer.all.sample.id , delivery: delivery_booleans.sample , status: status_strings.sample )    
end

Customer.find_by(name: "Lucas Sweeney").orders.destroy_all

puts "👩🏽‍🍳 Seeding dishes... 🧑🏽‍🍳"
60.times do
    Dish.create(quantity: rand(1..3), menu_item_id: MenuItem.all.sample.id, order_id: Order.all.sample.id)
end

puts "✅ Done seeding! ✅"

puts " Deleting empty orders "

Order.all.each do |order|
    if order.total_price == 0
        order.destroy
    end
end