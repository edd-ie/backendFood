Rails.application.routes.draw do
  resources :loyalties
  resources :inventories
  resources :order_tracks
  resources :orders
  resources :restaurant_reviews
  resources :food_reviews
  resources :fav_foods
  resources :fav_restaurants
  resources :foods
  resources :staffs
  resources :restaurants
  resources :customers
  # root routes
  root "fallback#home"
  get "*path", to: "fallback#error", constraints: ->(req) { !req.xhr? && req.format.html? }

end
