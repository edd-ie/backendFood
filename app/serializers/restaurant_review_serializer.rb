class RestaurantReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :restaurant_id, :customer_id, :like, :dislike, :rating

  belongs_to :customer
end
