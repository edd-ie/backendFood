class StaffSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :restaurant_id, :active

  belongs_to :restaurant
end
