class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.float :price
      t.text :image
      t.integer :inventory
    end
  end
end
