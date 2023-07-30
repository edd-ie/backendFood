class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.boolean :policy
      t.string :picture

      t.timestamps
    end
  end
end
