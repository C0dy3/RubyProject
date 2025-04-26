# Vyčistíme databázi
RecipeIngredient.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Chef.destroy_all

# --- CHEFS ---
chefs = []
5.times do
  chefs << Chef.create!(
    name: Faker::Name.name
  )
end

# --- INGREDIENTS ---
ingredients = []
10.times do
  ingredients << Ingredient.create!(
    name: Faker::Food.ingredient,
    spiciness: Ingredient.spicinesses.keys.sample  # << náhodně vybere no, mild nebo spicy
  )
end

# --- RECIPES ---
recipes = []
10.times do
  recipes << Recipe.create!(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    chef: chefs.sample
  )
end

# --- RECIPE INGREDIENTS ---
20.times do
  RecipeIngredient.create!(
    recipe: recipes.sample,
    ingredient: ingredients.sample,
    quantity: "#{rand(1..5)} #{['g', 'kg', 'ml', 'cups'].sample}"
  )
end

puts "✅ Seed hotov: #{Chef.count} chefs, #{Recipe.count} recipes, #{Ingredient.count} ingredients, #{RecipeIngredient.count} recipe ingredients!"
