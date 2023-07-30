class Customer < ApplicationRecord
    has_secure_password
    
    has_many :orders, dependent: :destroy
    has_many :order_tracks, dependent: :destroy
    has_many :fav_foods, dependent: :destroy
    has_many :fav_restaurants, dependent: :destroy
    has_many :order_tracks, through: :orders
    has_many :restaurant_reviews, dependent: :destroy
    has_many :food_reviews, dependent: :destroy
    has_many :restaurants, through: :restaurant_reviews

    # validates :username, :email, uniqueness: true, presence: true
    # validates :password, :password_confirmation, :phone, presence: true

    def allOrders
        self.orders.all
    end

    def activeOrders
        self.order_tracks.where(complete: false)
    end

    def favRes
        self.fav_restaurants.all
    end

    def favFoods
        self.fav_foods.all
    end

    def newRes(resId)
        res = self.fav_restaurants.find_by(restaurant_id: resId)
        if res 
            return res
        else
            newFav = self.fav_restaurants.create(restaurant_id: resId, customer_id: self.id)
            return newFav
        end
    end
    
    def newFood(id)
        res = self.fav_foods.find_by(food_id: id)
        if res 
            return res
        else
            newFav = self.fav_restaurants.create(food_id: id, customer_id: self.id)
            return newFav
        end
    end
end
