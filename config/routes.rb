Rails.application.routes.draw do
  # root routes
  root "fallback#home"
  # get "*path", to: "fallback#error", constraints: ->(req) { !req.xhr? && req.format.html? }
  
  # main routes
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

  # api routes
  ## Customer
  get "/customer/orders/:id", to: "customers#orders"
  get "/customer/activeOrders/:id", to: "customers#activeOrders"
  post "/customer/order", to: "orders#create"
  
  get "/customer/favRes/:id", to: "customers#favRes"
  post "/customer/newRes/:id", to: "customers#newFavRes"
  
  get "/customer/favFoods/:id", to: "customers#favFoods"
  post "/customer/newFood/:id", to: "customers#newFavFood"

  ## Restaurant
  get "/restaurant/orders/:id", to: "restaurants#orders"
  get "/restaurant/activeOrders/:id", to: "restaurants#activeOrders"
  patch "/restaurant/updateOrder/:id", to: "restaurants#updateOrder"

  get "/restaurant/menu/:id", to: "restaurants#menu"
  patch "/restaurant/updateMenu/:id", to: "foods#update"
  
  get "/restaurant/staff/:id", to: 'restaurants#staff'
  patch "/restaurant/updateStaff/:id", to: 'staffs#update'
end
