class CreateFavFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :fav_foods do |t|
      t.integer :customer_id
      t.integer :food_id

      t.timestamps
    end
  end
end
