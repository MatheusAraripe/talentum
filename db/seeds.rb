
puts "creating categories"
Category.destroy_all

Category.create(name: "Photography")
Category.create(name: "Painting")
Category.create(name: "Illustration")
Category.create(name: "Drawing")


puts "creating fake users"

User.destroy_all

User.create(first_name: "Pablo", last_name: "Picasso",
  email: "pablopicasso@email.com", nickname: "pablito", password: "123456", category_id: 2)

User.create(first_name: "Henri", last_name: "Cartier",
  email: "henricartier@email.com", nickname: "hcb", password: "123456", category_id: 1)

puts "Created all users and categories"
