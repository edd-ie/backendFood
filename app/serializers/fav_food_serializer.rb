class FavFoodSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :food_id, :rating

  belongs_to :food
  belongs_to :customer
end
