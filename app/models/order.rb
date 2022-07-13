class Order < ActiveRecord::Base 
    belongs_to :customer
    has_many :dishes
    has_many :menu_items, through: :dishes

    def total_price
        total = 0
        dishes.each do |d|
            total += (d.quantity * d.menu_item.price)
        end
        total.truncate(2)
    end

    def include_customer_dishes_total_price
        order_json = self.to_json(include: :customer)

        order_hash = JSON.parse(order_json)

        order_hash.store(:total_price , self.total_price)
        order_hash.store(:dishes , self.dishes.map {|d| {quantity: d.quantity , menu_item: d.menu_item.item_name} } )

        return order_hash
    end
end