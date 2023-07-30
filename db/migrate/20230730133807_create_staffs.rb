class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :title
      t.integer :restaurant_id
      t.boolean :active

      t.timestamps
    end
  end
end
