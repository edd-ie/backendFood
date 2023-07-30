class StaffSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :restaurant_id, :active
end
