class FavRestaurant < ApplicationRecord
    belongs_to :customer
    belongs_to :restaurant
end
