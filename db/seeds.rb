# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'
Category.destroy_all
Recipe.destroy_all

categories_api = "https://www.themealdb.com/api/json/v1/1/categories.php"
categories_serialized = URI.open(categories_api).read
categories = JSON.parse(categories_serialized)["categories"]


40.times do
  p "Creating Recipe"
  recipe_api = "https://www.themealdb.com/api/json/v1/1/random.php"
  recipe_serialized = URI.open(recipe_api).read
  recipe = JSON.parse(recipe_serialized)["meals"][0]

  if recipe
    p "#{recipe["strMeal"]} API object retrived"
    new_recipe = Recipe.new({
      name: recipe["strMeal"],
      description: recipe["strInstructions"],
      image_url: recipe["strMealThumb"],
      rating: rand(0.0..10.0).round(1) })
  end

  if new_recipe.save
    p "#{new_recipe.name} has been added to the database"
    categories.each do |category|
        if (recipe["strCategory"] == category["strCategory"]) &&
           !(Category.where(name: recipe["strCategory"]).exists?)
          p "Adding New Category"
          new_category = Category.new({
            name: recipe["strCategory"],
            image_url: category["strCategoryThumb"]
          })
          new_category.save ? (p "#{new_category.name} has been added to the database") : (p "#{new_category.name} failed to be added to the database")
        else
          p "#{category["strCategory"]} already exists"

        end
      end
  else
    p "#{new_recipe.name} failed to be added to the database"
    p new_recipe.errors.full_messages
  end
end
