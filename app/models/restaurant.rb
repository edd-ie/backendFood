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

    def categorySale
        track = self.order_tracks.where(paid: true)
        category = {}
        track.each{|sale|
            category[Food.find(Order.find(sale.order_id)[:food_id][1])[:category]] += Order.find(sale.order_id)[:total]
        }
        category
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


    def transactions
        all = self.order_tracks.all.where(paid: true)
        allTime = []
        all.each{|x| 
            day = x[:updated_at].to_s.split(' ')[0].split('-')
            allTime.push(
                {time: day[1]+'/'+day[2], 
                total: Order.find(x.order_id)[:total]}
            )
        }
        month = []
        allTime.each{|x|
            comp = Date.today.month
            if x[:time].split('/')[0].to_i == comp
                month.push(x)
            end
        }
        day = []
        month.each{|x|
            date = Date.today.day
            if x[:time].split('/')[1].to_i == date
                day.push(x)
            end
        }

        transactions = {
            all: allTime,
            month: month,
            day: day
        }
    end
    

    def rankings
        orders = self.orders.all
        category = {}
        foods = {}
        orders.each do |x|
            x[:food_id].each do |id|
                item = Food.find(id)
                category[item[:category]] ||= 0 # initialize the value to 0 if it doesn't exist
                category[item[:category]] += 1 # increment the value by 1
                
                foods[item[:name]] ||= 0 # initialize the value to 0 if it doesn't exist
                foods[item[:name]] += 1 # increment the value by 1
            end
        end
        category.delete(nil)
        foods.delete(nil)

        category = category.sort_by {|k,v| -v}
        foods = foods.sort_by {|k,v| -v}

        data1 = {}
        category.each{|x|
            data1[x[0]] = x[1]
        }
        data2 = {}
        foods.each{|x|
            data2[x[0]] = x[1]
        }

        {categories:data1, foods:data2}
    end
end
