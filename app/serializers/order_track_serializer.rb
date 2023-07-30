class OrderTrackSerializer < ActiveModel::Serializer
  attributes :id, :items, :status, :order_id, :restaurant_id, :staff_id, :chef_id, :paid, :complete
end
