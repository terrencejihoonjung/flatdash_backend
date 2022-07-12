class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.integer :quantity
      t.integer :menu_item_id
      t.integer :order_id
    end
  end
end
