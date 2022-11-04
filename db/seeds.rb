# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "trung", email: "trungnq@gmail.com", password: "asd123", password_confirmation: "asd123")

Product.create(name: "Gun", description: "This is good for kill others people", price: 5.5, user_id: User.first.id, shop_id: Shop.first.id)
Product.create(name: "Paper", description: "Paper that you can print document", price: 1.0, user_id: User.first.id, shop_id: Shop.first.id)
Product.create(name: "Knife", description: "Help you to cook good dinner", price: 3.2, user_id: User.first.id ,shop_id: Shop.first.id)
Product.create(name: "Water", description: "If you dry, it's very delicious", price: 2.0, user_id: User.first.id, shop_id: Shop.first.id)
Product.create(name: "Television", description: "Help you entertain after work's day", price: 100, user_id: User.first.id, shop_id: Shop.first.id)
Product.create(name: "Book", description: "You will be greater than yesterday", price: 10, user_id: User.first.id, shop_id: Shop.first.id)
Product.create(name: "Umbrella", description: "It's is tool for rainny day", price: 100, user_id: User.first.id, shop_id: Shop.first.id)
