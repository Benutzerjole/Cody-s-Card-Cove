# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'faker'

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

category_json_file = Rails.root.join("db/json/Categories.json")
category_json_data = File.read(category_json_file)

categories = JSON.parse(category_json_data)

categories.each do |category|
  puts("Creating #{category} category.")
  current_category = Category.find_or_create_by(name: category)
  
  current_json_file = Rails.root.join("db/json/#{category}.json")
  current_json_data = File.read(current_json_file)

  products = JSON.parse(current_json_data)

  products.each do |key, value|
    Product.create(name: key, description: value['description'], base_price: value['price'], quantity_in_stock: Faker::Number.between(from: 0, to: 100), category: current_category)
  end
end

Province.create(name: "British Columbia", gst: 0.05, pst: 0.07, hst: 0)
Province.create(name: "Alberta", gst: 0.05, pst: 0, hst: 0)
Province.create(name: "Saskatchewan", gst: 0.05, pst: 0.06, hst: 0)
Province.create(name: "Manitoba", gst: 0.05, pst: 0.07, hst: 0)
Province.create(name: "Ontario", gst: 0, pst: 0, hst: 0)
Province.create(name: "Quebec", gst: 0.05, pst: 0.07, hst: 0.13)
Province.create(name: "Newfoundland and Labrador", gst: 0, pst: 0, hst: 0.15)
Province.create(name: "Nova Scotia", gst: 0, pst: 0, hst: 0.15)
Province.create(name: "New Brunswick", gst: 0, pst: 0, hst: 0.15)
Province.create(name: "Prince Edward Island", gst: 0, pst: 0, hst: 0.15)
Province.create(name: "Yukon", gst: 0.05, pst: 0, hst: 0)
Province.create(name: "Northwest Territories", gst: 0.05, pst: 0, hst: 0)
Province.create(name: "Nunavut", gst: 0.05, pst: 0, hst: 0)