puts "Seeding Data ...🌱🌱🌱"

Customer.create(username: "User1", email: "user@gmail.com", password: "1234", password_confirmation: "1234",
    phone: "0123456789", policy: true, picture: "https://th.bing.com/th/id/OIP.SKcexVoRNnffvOMny6sSvAHaDt?pid=ImgDet&rs=1"
)

Restaurant.create(name: "Orient", email: "res@gmail.com", password: "1234", password_confirmation: "1234",
    phone: "0123456789", policy: true, till_num:160580, ambience:"cultural", ratings: 4,
    cuisine: "Chinese", price_range: "$$",
    picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
    latitude: -1.298300, longitude: 36.801060
)
Restaurant.create(name: "Bougie", email: "res1@gmail.com", password: "1234", password_confirmation: "1234",
    phone: "0123456789", policy: true, till_num:160580, ambience:"luxury", ratings: 4,
    cuisine: "swahili", price_range: "$$$",
    picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
    latitude: -1.398300, longitude: 36.831060
)
Restaurant.create(name: "WaySub", email: "res@gmail.com", password: "1234", password_confirmation: "1234",
    phone: "0123456789", policy: true, till_num:160580, ambience:"urban", ratings: 4,
    cuisine: "fastFood", price_range: "$",
    picture: "https://th.bing.com/th/id/R.cedfefd8e352d0aa0032a17d67d83c2a?rik=ThkhfDVxcANZHw&pid=ImgRaw&r=0",
    latitude: -1.598300, longitude: 36.5901060
)

puts "✅✅✅...Seeding Data Complete"	