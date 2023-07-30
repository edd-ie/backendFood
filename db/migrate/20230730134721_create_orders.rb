class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text "items"
      t.text "food_id"
      t.integer "customer_id"
      t.integer "restaurant_id"
      t.float "latitude"
      t.float "longitude"
      t.float "discount"
      t.integer "service_fee"
      t.float "total"

      t.timestamps
    end
  end
end
