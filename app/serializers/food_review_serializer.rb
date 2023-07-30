class FoodReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :food_id, :customer_id, :like, :dislike
end
