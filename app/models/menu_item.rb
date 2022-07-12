class MenuItem < ActiveRecord::Base 
    has_many :dishes
    has_many :orders, through: :dishes
end