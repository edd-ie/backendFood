class LoyaltySerializer < ActiveModel::Serializer
  attributes :id ,:points ,:restaurant_id ,:customer_id

  belongs_to :restaurant
end
