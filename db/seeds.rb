# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |hash|
  # create loop to add all ingredients in db, drinks is array, ingredients are hashes
  Ingredient.create!(name: hash['strIngredient1'])
end

result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail').read)
cocktails = result['drinks']

cocktails.each do |hash|
  # create loop to add all ingredients in db, drinks is array, ingredients are hashes
  Cocktail.create!(name: hash['strDrink'], image: hash['strDrinkThumb'])
end


description = ["1oz", "2oz", "4oz"]

10.times do
  Dose.create!(description: description.sample, ingredient: Ingredient.all.sample, cocktail: Cocktail.all.sample)
end

# photo: hash['strDrinkThumb']
