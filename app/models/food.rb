class Food < ApplicationRecord
    belongs_to :restaurant
    has_many :orders, dependent: :destroy
    has_many :fav_foods, dependent: :destroy
    has_many :food_reviews, dependent: :destroy

    def foodReviews
        self.food_reviews
    end

    def ratings
        count = self.food_reviews.length
        total = 5*count
        sum = 0
        self.food_reviews.each{|x| 
           sum += x[:rating]
        }
        rating = (((sum/total.to_f))*5).round(1)
        self.update(ratings: rating)
        rating
    end
end