class CreateFoodReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :food_reviews do |t|
      t.text :comment
      t.integer :food_id
      t.integer :customer_id
      t.integer :like
      t.integer :dislike
      t.integer :rating

      t.timestamps
    end
  end
end
