# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

if Rails.env.development?
  Ingredient.destroy_all
  Cocktail.destroy_all
end

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_list = JSON.parse(ingredient_serialized)

# criar um ingrediente para cada hash dentro do array
ingredient_list["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts 'Ingredients list done!'


puts 'Creating good cocktails...'

20.times do 
  cocktail = Cocktail.create(
    name: Faker::Space.constellation
  )
end

puts 'Cocktails created!'