class FavFoodSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :food_id
end
