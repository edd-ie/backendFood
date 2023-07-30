class CreateLoyalties < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalties do |t|
      t.integer "points"
      t.integer "customer_id"
      t.integer "restaurant_id"
      t.boolean "used"

      t.timestamps
    end
  end
end
