class OrderSerializer < ActiveModel::Serializer
  attributes :id,:items,:food_id,:customer_id,:restaurant_id,:latitude,:longitude,:discount,:service_fee,:total
end
