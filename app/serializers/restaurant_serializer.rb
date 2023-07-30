class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :policy, :pay_bill, :acc_num, :till_num, :ambience, :cuisine, :price_range, :latitude, :longitude, :ratings, :picture
end
