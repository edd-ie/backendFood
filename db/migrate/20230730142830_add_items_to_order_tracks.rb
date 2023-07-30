class AddItemsToOrderTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :order_tracks, :items, :text
  end
end
