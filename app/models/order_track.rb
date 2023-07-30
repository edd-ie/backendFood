class OrderTrack < ApplicationRecord
    belongs_to :order
    belongs_to :staff
    belongs_to :restaurant
    serialize :items, Array
end
