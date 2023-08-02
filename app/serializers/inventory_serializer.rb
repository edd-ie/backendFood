class InventorySerializer < ActiveModel::Serializer
  attributes :id , :name , :quantity ,:restaurant_id

  belongs_to :restaurant
end
