class FavRestaurantSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :customer_id
  belongs_to :restaurant
end
