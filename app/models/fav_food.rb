class FavFood < ApplicationRecord
    belongs_to :customer
    belongs_to :food
end
