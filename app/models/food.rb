class Food < ApplicationRecord
    belongs_to :restaurant
    has_many :orders, dependent: :destroy
    has_many :fav_foods, dependent: :destroy

end
