puts "🙋‍♀️ Seeding customers... 🙋" 

random_email = ["@gmail.com", "@yahoo.com", "@ymail.com"]

5.times do
    name = Faker::Name.unique.name
    email_address = name.downcase.gsub(/[\s+ \.]/, "") + random_email.sample
    phone_number = Faker::PhoneNumber.cell_phone
    Customer.create(name: name, email_address: email_address , phone_number: phone_number)
end

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
