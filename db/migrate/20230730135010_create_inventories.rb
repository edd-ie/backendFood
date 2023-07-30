class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string "item"
      t.integer "quantity"
      t.integer "restaurant_id"

      t.timestamps
    end
  end
end
