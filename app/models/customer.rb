class Customer < ActiveRecord::Base 
    has_many :orders

    def total_spent
        total = 0
        orders.each do |o|
            total += o.total_price
        end
        total
    end

    def dishes_stats
        fav_dishes = {}
        self.orders.each do |order|
            order.dishes.each do |dish|
                name = dish.menu_item.item_name
                qty = dish.quantity

                if fav_dishes.has_key?(name)
                    fav_dishes[name] += qty
                else
                    fav_dishes[name] = qty
                end
            end
        end
        fav_dishes
    end

    def favorite_dish
        fave = dishes_stats.max_by{|dish, quantity| quantity}[0]
        return fave
        # quantity = dishes_stats[fave]
        # "#{fave} ordered #{quantity} times"
    end

    def include_total_spent_dishes_stats_favorite_dish
        customer_json = self.to_json(include: { orders: {only: [:id , :status , :delivery , :created_at , :updated_at ] } })

        customer_hash = JSON.parse(customer_json)

        customer_hash.store(:total_spent , self.total_spent)

        customer_hash.store(:dishes_stats , self.dishes_stats)

        customer_hash.store(:favorite_dish , self.favorite_dish)

        return customer_hash
    end

    def days_since_first_order
        seconds = Time.now - orders.first.created_at
        (seconds/(24*60*60)).floor
    end

    def days_since_last_order
        seconds = Time.now - orders.last.created_at
        (seconds/(24*60*60)).floor
    end
end