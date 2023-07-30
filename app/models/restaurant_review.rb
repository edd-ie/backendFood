class RestaurantReview < ApplicationRecord
    belongs_to :restaurant
    belongs_to :customer

    validates :comment, :restaurant_id, :customer_id,  presence: true
    
end
