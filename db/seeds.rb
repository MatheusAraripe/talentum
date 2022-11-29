require "open-uri"

puts "Destroy all the DB"
Post.destroy_all
User.destroy_all
Category.destroy_all

puts "create all the categories"

Category.create(name: "Photography")
Category.create(name: "Painting")
Category.create(name: "Illustration")
Category.create(name: "Drawing")

draw = Category.last

puts "creating fake users"

description = "Lorem Ipsum is simply dummy text of the printing and
typesetting industry. Lorem Ipsum has been the industry's standard dummy
text ever since the 1500s, when an unknown printer took a galley of type and scram ;
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
Ipsum has been the industry's standard dummy text ever since the 1500s, when an
unknown printer took a galley of type and scram "

User.create(first_name: "Pablo", last_name: "Picasso",
  email: "pablopicasso@email.com", nickname: "pablito", password: "123456", category_id: draw.id, description: description)

User.create(first_name: "Henri", last_name: "Cartier",
  email: "henricartier@email.com", nickname: "hcb", password: "123456", category_id: draw.id, description: description)

henri = User.last

puts "creating fake posts"

file = URI.open("https://unsplash.com/photos/g85autyD7IQ")
post = Post.new(title: "Neon", description: "Neon in China", category_id: draw.id, user_id: henri.id)
post.photo.attach(io: file, filename: "neon.png", content_type: "image/png")
post.save

puts "Created all users, categories and posts"
