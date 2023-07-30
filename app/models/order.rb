class Order < ApplicationRecord
    serialize :items, Array
    serialize :food_id, Array
    has_one :order_track, dependent: :destroy
    belongs_to :customer
    belongs_to :restaurant

    #get array of items & food_ids from Front
    def newTrack
        OrderTrack.create!(
            items: self.items,
            status: "prepping",
            order_id: self.id,
            staff_id: 1,
            restaurant_id: self.restaurant_id,
            paid: false,
            complete: false,
        )
    end
end
