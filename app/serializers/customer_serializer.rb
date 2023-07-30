class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone, :policy, :picture
end
