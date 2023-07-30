class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.text :ingredients
      t.integer :price
      t.integer :discount
      t.integer :restaurant_id
      t.boolean :vegetarian
      t.boolean :allergen
      t.float :ratings
      t.string :picture

      t.timestamps
    end
  end
end
