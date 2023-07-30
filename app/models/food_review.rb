class FoodReview < ApplicationRecord
    belongs_to :food
    belongs_to :customer

    validates :comment, :food_id, :customer_id,  presence: true
end
