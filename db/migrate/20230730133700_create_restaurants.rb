class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.boolean :policy
      t.integer :pay_bill
      t.integer :acc_num
      t.integer :till_num
      t.string :ambience
      t.string :cuisine
      t.string :price_range
      t.float :latitude
      t.float :longitude
      t.float :ratings
      t.string :picture

      t.timestamps
    end
  end
end
