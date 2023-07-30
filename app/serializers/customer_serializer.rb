class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :phone, :policy, :picture
end
