# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(email_address: "user@test.com", password: "123456", role: "user")
admin = User.create!(email_address: "admin@test.com", password: "123456", role: "admin")


category = Category.find_or_create_by(name: "Bikes")
product = Product.create(name: "super bike", category: category, base_price: 1000, description: "super bike", in_stock: true)
component1 = Component.create(name: "Wheel", product: product)
component2 = Component.create(name: "Frame", product: product)
option1 = Option.create(name: "Red", price: 100, in_stock: true, component: component1)
option2 = Option.create(name: "Blue", price: 200, in_stock: true, component: component1)
option3 = Option.create(name: "Green", price: 300, in_stock: true, component: component2)
option4 = Option.create(name: "Yellow", price: 400, in_stock: true, component: component2)

PriceAdjustment.create(first_option: option1, second_option: option3, price: 10)
PriceAdjustment.create(first_option: option2, second_option: option4, price: -10)
IncompatablityRule.create(first_option: option1, second_option: option4, product: product)
