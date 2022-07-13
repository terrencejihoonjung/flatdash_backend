class Order < ActiveRecord::Base 
    belongs_to :customer
    has_many :dishes
    has_many :menu_items, through: :dishes

    def totalPrice 
        self.menu_items.sum(:price)
    end
end