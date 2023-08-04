class Restaurant < ApplicationRecord
    has_secure_password
    has_many :foods, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :fav_restaurants, dependent: :destroy
    has_many :inventories, dependent: :destroy
    has_many :loyalties, dependent: :destroy
    has_many :staffs, dependent: :destroy
    has_many :order_tracks, dependent: :destroy
    has_many :restaurant_reviews, dependent: :destroy
    has_many :customers, through: :restaurant_reviews

    validates :name, :email, :phone, :ambience, 
    :price_range, :cuisine, presence: true

    validates :policy, acceptance: { accept: [true, 'yes'] }
    validates :email, uniqueness: true

    def allOrders
        self.order_tracks.all
    end

    def activeOrders
        self.order_tracks.where(complete: false)
    end

    def activeStaff
        self.staffs.where(active: true)
    end

    def orderUpdate(id,values)
        track = self.order_tracks.find_by(order_id:id)
        track.update(values)
    end

    
    def allStaff
        self.staffs.all
    end
    
    def menu
        self.foods.all
    end

    def menuChange(id, values)
        food = self.foods.find_by(id:id)
        food.update(values)
    end

    def category(value)
        self.foods.where(category: value)
    end

    def reviews
        self.restaurant_reviews
    end

    def sales
        sale = self.order_tracks.where(paid: true)
        total = 0
        counter = sale.each{|y| total += Order.find(y.order_id).total}
        total
    end

    def test
        y = self.order_tracks.where(paid: true)
        z = y.each{|c| z.push(Order.find(c.order_id))}
        i = {}
        z.each{|x| i[Food.find(x.food_id[0])] = Food.find(x.food_id[0]).price i[Food.find(x.food_id[1])] = Food.find(x.food_id[1]).price }
    end

    def ratings
        count = self.restaurant_reviews.length
        total = 5*count
        sum = 0
        self.restaurant_reviews.each{|x| 
            sum += x[:rating]
        }
        rating = (((sum/total.to_f))*5).round(1)
        self.update(ratings: rating)
        rating
    end
    
end
