class Customer < ActiveRecord::Base 
    has_many :orders

    def total_spent
        total = 0
        orders.each do |o|
            total += o.total_price
        end
        total
    end

    def favorite_dish
        # have to go into orders and then dish.quantity
    end

    def days_since_first
        seconds = Time.now - orders.first.created_at
        (seconds/(24*60*60)).floor
    end

    def days_since_last
        seconds = Time.now - orders.last.created_at
        (seconds/(24*60*60)).floor
    end
end