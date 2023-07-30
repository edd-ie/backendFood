class Order < ApplicationRecord
    serialize :items, Array
    serialize :food_id, Array
    has_one :order_track, dependent: :destroy
    belongs_to :customer
    belongs_to :restaurant

    #get array of items & food_ids from Front
    def newTrack
        track = self.order_track.create!(
            status: "Prepping",
            order_id: self.id,
            restaurant_id: self.restaurant_id,
            paid: false,
            complete: false,
            items: self.items
        )
        track
    end
end
