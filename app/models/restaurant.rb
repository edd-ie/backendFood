class Restaurant < ApplicationRecord
    has_secure_password
    has_many :foods, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :fav_restaurants, dependent: :destroy
    has_many :inventories, dependent: :destroy
    has_many :loyalties, dependent: :destroy
    has_many :staffs, dependent: :destroy
    has_many :order_tracks, dependent: :destroy
    has_many :restaurant_reviews
    has_many :customers, through: :restaurant_reviews

    validates :name, :email, :phone, :ambience, 
    :price_range, :cuisine, :picture, :latitude, 
    :longitude, presence: true

    validates :policy, acceptance: { accept: [true, 'yes'] }
    validates :email, uniqueness: true

    def allOrders
        self.orders_tracks.all
    end

    def activeOrders
        self.orders_tracks.where(complete: false)
    end

    def activeStaff
        self.staffs.where(active: true)
    end

    def orderUpdate(id,values)
        track = self.order_tracks.find_by(order_id:id)
        track.update(values)
        track
    end

    
    def allStaff
        self.staffs.all
    end
    
    def menu
        self.foods.all
    end
end
