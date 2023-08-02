class InventorySerializer < ActiveModel::Serializer
  attributes :id , :item , :quantity ,:restaurant_id

end
