puts "🙋‍♀️ Seeding customers... 🙋" 

random_email = ["@gmail.com", "@yahoo.com", "@ymail.com"]

Customer.create(name: "Terrence Jung", email_address: "terrencejung928@gmail.com", phone_number: "827-839-9022")
Customer.create(name: "Mark Reese", email_address: "markreese@gmail.com", phone_number: "748-828-0829")
Customer.create(name: "Yifan Wu", email_address: "yifanwu@gmail.com", phone_number: "027-833-2799")
Customer.create(name: "Emiley Palmquist", email_address: "emileypalmquist@gmail", phone_number: "123-455-0928")
Customer.create(name: "Gordon Ramsay", email_address: "idiotsandwich@gmail.com", phone_number: "444-555-6666")

puts "🍔 Seeding menu items... 🍝"

25.times do
    item_name = Faker::Food.unique.dish
    price = (rand(1..20) + rand()).truncate(2)
    inventory = rand(1..15)
    image = Faker::Internet.unique.url
    MenuItem.create(item_name: item_name , price: price , image: image , inventory: inventory)
end

puts "💰 Seeding orders... 💵" 

status_strings = ["Queued", "In-Progress", "Fulfilled"]
delivery_booleans = [true , false]

15.times do 
    Order.create( customer_id: Customer.all.sample.id , delivery: delivery_booleans.sample , status: status_strings.sample )    
end

puts "👩🏽‍🍳 Seeding dishes... 🧑🏽‍🍳"
10.times do
    Dish.create(quantity: rand(1..3), menu_item_id: MenuItem.all.sample.id, order_id: Order.all.sample.id)
end

puts "✅ Done seeding! ✅"
