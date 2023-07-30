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
Restaurant.create(name: "WaySub", email: "res2@gmail.com", password: "1234", password_confirmation: "1234",
    phone: "0123456789", policy: true, till_num:160580, ambience:"urban", ratings: 4,
    cuisine: "fastFood", price_range: "$",
    picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
    latitude: -1.598300, longitude: 36.5901060
)

cat = ['Burgers', 'Fries', 'Sides', 'Main', 'Desserts']
n = 0
10.times do
    Food.create(
        name: Faker::Food.dish,
        price: 100*(n+1),
        category: cat[n],
        vegetarian: false,
        allergen: false,
        restaurant_id: 1,
        picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1",
        ingredients: Faker::Food.description,
        discount: 0,
        ratings: 4
    )
    n+=1
end

n = 0
6.times do
    Food.create(
        name: Faker::Food.dish,
        price: 250*(n+1),
        category: cat[n],
        vegetarian: true,
        allergen: true,
        restaurant_id: 1,
        picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1",
        ingredients: Faker::Food.description,
        discount: 0,
        ratings: 4
    )
    n+=1
end




# 2.times do
#     x = Order.new(
#         items:,
#         discount: 0,
#         latitude: -1.198300,
#         longitude: 36.801060,
#         restaurant_id: 1,
#         customer_id: 1,
#         food_id: [7,6],
#         service_fee: 50,
#         total: 1200,
#     )
# end

puts "✅✅✅...Seeding Data Complete"	