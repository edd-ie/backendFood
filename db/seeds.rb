puts "Seeding Data ...🌱🌱🌱"

# Customer.create(username: "User1", email: "user@gmail.com", password: "1234", password_confirmation: "1234",
#     phone: "0123456789", policy: true, picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1"
# )

# Restaurant.create(name: "Orient", email: "res@gmail.com", password: "1234", password_confirmation: "1234",
#     phone: "0123456789", policy: true, till_num:160580, ambience:"cultural", ratings: 4,
#     cuisine: "Chinese", price_range: "$$",
#     picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
#     latitude: -1.298300, longitude: 36.801060
# )

# Restaurant.create(name: "Bougie", email: "res1@gmail.com", password: "1234", password_confirmation: "1234",
#     phone: "0123456789", policy: true, till_num:160580, ambience:"luxury", ratings: 4,
#     cuisine: "swahili", price_range: "$$$",
#     picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
#     latitude: -1.398300, longitude: 36.831060
# )
# Restaurant.create(name: "WaySub", email: "res2@gmail.com", password: "1234", password_confirmation: "1234",
#     phone: "0123456789", policy: true, till_num:160580, ambience:"urban", ratings: 4,
#     cuisine: "fastFood", price_range: "$",
#     picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
#     latitude: -1.598300, longitude: 36.5901060
# )

# cat = ['Burgers', 'Fries', 'Sides', 'Main', 'Desserts']
# n = 0
# 10.times do
#     Food.create(
#         name: Faker::Food.dish,
#         price: 100*(n+1),
#         category: cat[n],
#         vegetarian: false,
#         allergen: false,
#         restaurant_id: 1,
#         picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1",
#         ingredients: Faker::Food.description,
#         discount: 0,
#         ratings: 4
#     )
#     n+=1
# end

# n = 0
# 6.times do
#     Food.create(
#         name: Faker::Food.dish,
#         price: 250*(n+1),
#         category: cat[n],
#         vegetarian: true,
#         allergen: true,
#         restaurant_id: 1,
#         picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1",
#         ingredients: Faker::Food.description,
#         discount: 0,
#         ratings: 4
#     )
#     n+=1
# end


# one = [['cheeseburger','Arepas'],['sush', 'humus'],
#     ['chicken fajitas', 'Ricotta stuffed Ravioli'],
#     ['chicken tikka masala', 'Pasta with chicken'],
#     ['pizza', 'Pizza with mozzarella']
# ]

# two = [[1,2], [3,4], [5,6], [7,8], [9,10]]
# n = 0

# 5.times do
#     Order.create(
#         items:one[n],
#         discount: 0,
#         latitude: -1.198300,
#         longitude: 36.801060,
#         restaurant_id: 1,
#         customer_id: 1,
#         food_id: two[n],
#         service_fee: 50,
#         total: 1200,
#     )
#     n += 1
# end

# #Seed data for the "inventories" table
# inventories_data = [
#   { item: "Potatoes", quantity: 50, restaurant_id: 1 },
#   { item: "Tomatoes", quantity: 30, restaurant_id: 1 },
#   { item: "Carots", quantity: 20, restaurant_id: 1 },
#   { item: "Onions", quantity: 15, restaurant_id: 1 },
# ]

# # Create the inventories records in the database
# inventories_data.each{|x|
#   Inventory.create(x)
# }

# #Seed data for the "fav_foods" table
# fav_foods_data = [
#   { customer_id: 1, food_id: 1 },
#   { customer_id: 1, food_id: 2 },
#   { customer_id: 2, food_id: 3 },
#   { customer_id: 2, food_id: 4 },
#   # Add more data as needed
# ]

# # Create the fav_foods records in the database
# fav_foods_data.each{|x|
#     FavFood.create(x)
# }

# #Seed data for the "fav_foods" table
# fav_res_data = [
#   { customer_id: 1, restaurant_id: 1 },
#   { customer_id: 1, restaurant_id: 2 },
#   { customer_id: 2, restaurant_id: 3 }
# ]

# # Create the fav_res records in the database
# fav_res_data.each{|x|
#     FavRestaurant.create(x)
# }

# Staff.create!(
#     name: "Jeeves",
#     title: "manager",
#     restaurant_id: 1,
#     active: true,
# )
# Staff.create!(
#     name: "Ratatouille",
#     title: "chef",
#     restaurant_id: 1,
#     active: true,
# )
# Staff.create!(
#     name: "Croissant",
#     title: "chef",
#     restaurant_id: 1,
#     active: true,
# )
# Staff.create!(
#     name: "Annette",
#     title: "chef",
#     restaurant_id: 1,
#     active: true,
# )

# OrderTrack.create!(
#     status: "prepping",	
#     order_id: 1,
#     restaurant_id: 1,
#     staff_id: 1,
#     chef_id: 1,
#     paid: false,
#     complete: false,
# )
# OrderTrack.create!(
#     status: "cooking",	
#     order_id: 2,
#     restaurant_id: 1,
#     staff_id: 1,
#     chef_id: 2,
#     paid: true,
#     complete: false,
# )
# OrderTrack.create!(
#     status: "Done",	
#     order_id: 3,
#     restaurant_id: 1,
#     staff_id: 1,
#     chef_id: 3,
#     paid: true,
#     complete: true,
# )
# OrderTrack.create!(
#     status: "Done",	
#     order_id: 4,
#     restaurant_id: 1,
#     staff_id: 1,
#     chef_id: 4,
#     paid: false,
#     complete: true,
# )
# OrderTrack.create!(
#     status: "Done",	
#     order_id: 5,
#     restaurant_id: 1,
#     staff_id: 1,
#     chef_id: 4,
#     paid: true,
#     complete: true,
# )

puts "✅✅✅...Seeding Data Complete"	