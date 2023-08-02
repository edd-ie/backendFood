class OrderSerializer < ActiveModel::Serializer
  attributes :id,:items,:food_id,:customer_id,:restaurant_id,:latitude,:longitude,:discount,:service_fee,:total

  belongs_to :customer
  belongs_to :restaurant
  has_one :order_track
end
