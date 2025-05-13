# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

category = Category.find_or_create_by(name: "Bikes")
product = Product.create(name: "super bike", category: category, base_price: 1000, description: "super bike", in_stock: true)
Component.create(name: "Wheel", product: product)
Component.create(name: "Frame", product: product)

