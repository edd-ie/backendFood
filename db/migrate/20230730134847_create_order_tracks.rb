class CreateOrderTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :order_tracks do |t|
      t.string "status"
      t.integer "order_id"
      t.integer "restaurant_id"
      t.integer "staff_id"
      t.integer "chef_id"
      t.boolean "paid"
      t.boolean "complete"

      t.timestamps
    end
  end
end
