class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :ingredients, :price, :discount, :restaurant_id, :vegetarian, :allergen, :ratings, :picture
end
