class FoodReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :food_id, :customer_id, :like, :dislike, :rating
  belongs_to :customer
end
