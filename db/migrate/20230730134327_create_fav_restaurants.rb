class CreateFavRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :fav_restaurants do |t|
      t.string :restaurant_id
      t.string :customer_id

      t.timestamps
    end
  end
end
