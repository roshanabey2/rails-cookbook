# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"


 40.times do
  p "Creating Recipe"
  recipe_api = "https://www.themealdb.com/api/json/v1/1/random.php"
  recipe_serialized = URI.parse(recipe_api).read
  recipe = JSON.parse(recipe_serialized)["meals"][0]
  p recipe
  new_recipe = Recipe.new({ name: recipe["strMeal"], description: recipe["strInstructions"], image_url: recipe["strMealThumb"], rating: rand(0..10) })
  new_recipe.save
  p "#{new_recipe.name} has been added to the database"
end
