# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating three users..."

jim = User.create!(email: 'jim@pubgrub.com', fname: 'Jim', role: :admin, password: 'password')
dana = User.create!(email: 'dana@pubgrub.com', fname: 'Dana', role: :admin, password: 'password')
User.create!(email: 'someguy@somewhere.com', fname: 'Dave', role: :member, password: 'password')

# puts "Creating two meals..."
#
# Meal.create(name: 'Steak', cuisine: 'American', user_id: jim.id)
# Meal.create(name: 'Beet Pasta', cuisine: 'Mom', user_id: dana.id)


# split meal into entree and sides:

# create cuisine categories
#   validate unique
# create side_categories
#   validates unique
# create entrees
#   validates unique, belongs_to user, cuisines and side categories
#   enum: sides: 0 with_zero, 1, with_one...
# change ingredients to be polymorphic
# create sides
#   validates unique, belongs_to user and cuisines
# test it all

puts 'Creating five cuisine categories...'

american = Cuisine.create!(name: 'American')
cajun = Cuisine.create!(name: 'Cajun')
asian_food = Cuisine.create!(name: 'Asian')
german = Cuisine.create!(name: 'German')
caribbean = Cuisine.create!(name: 'Caribbean')


puts "Creating four side categories..."

starch = SideCategory.create!(name: 'Starch')
asian = SideCategory.create!(name: 'Asian')
vege = SideCategory.create!(name: 'Vegetable')
bread = SideCategory.create!(name: 'Bread')
german_cat = SideCategory.create!(name: 'German')

puts "Creating eight entreees..."

steak = Entree.create!(name: 'Steak', cuisine_id: american.id, user_id: jim.id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [starch.id, bread.id])
jambalaya = Entree.create!(name: 'Jambalaya', cuisine_id: cajun.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
stew = Entree.create!(name: 'Beef Stew', cuisine_id: american.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
goj_chx = Entree.create!(name: 'Gochujang Chicken', cuisine_id: asian_food.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
saus = Entree.create!(name: 'Sausage and Potatoes', cuisine_id: german.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
cpc = Entree.create!(name: 'Coconut Peanut Chicken', cuisine_id: asian_food.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
carib_chx = Entree.create!(name: 'Caribbean Chicken', cuisine_id: caribbean.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [caribbean.id, caribbean.id])
schnitzel = Entree.create!(name: 'Chicken Schnitzel', cuisine_id: german.id, user_id: dana.id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [vege.id, german_cat.id])

puts "Creating eight sides..."

Side.create!(name: 'Baked Potato', side_category_id: starch.id)
Side.create!(name: 'Mashed Potatoes', side_category_id: starch.id)
Side.create!(name: 'Sesame Green Breans', side_category_id: asian.id)
Side.create!(name: 'Edamame', side_category_id: asian.id)
Side.create!(name: 'Mixed Frozen Vege', side_category_id: vege.id)
Side.create!(name: 'Asparagus', side_category_id: vege.id)
Side.create!(name: 'French Bread', side_category_id: bread.id)
Side.create!(name: 'Garlic Bread', side_category_id: bread.id)

puts "Creating twenty-three ingredients..."

Ingredient.create!(grocery: 'steak', quantity: 1, measurement: 'NY Strip', ingredientable_id: steak.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: "Uncle Ben's rice", quantity: 1, measurement: 'bag', ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'kidney beans', quantity: 1, measurement: "can", ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'celery', quantity: 1, measurement: 'stalk', ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'red pepper', quantity: 1, ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'stew beef', quantity: 1, measurement: 'pound', ingredientable_id: stew.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'carrots', quantity: 1, measurement: 'bunch', ingredientable_id: stew.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'onion', quantity: 1, ingredientable_id: stew.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Full Chicken', quantity: 1, ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Gochujang Paste', quantity: 5, measurement: 'Tablespoons', ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Small potatoes', quantity: 1, measurement: 'pound', ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'onion', quantity: 1, ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Sweet Sausage', quantity: 1, measurement: 'pound', ingredientable_id: saus.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Small potatoes', quantity: 1, measurement: 'pound', ingredientable_id: saus.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'peanuts', quantity: 2, measurement: 'Cups', ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Chicken Breast', quantity: 2, ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Coconut milk', quantity: 1, measurement: 'Can', ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Chicken Breast', quantity: 2, ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Plaintain', quantity: 1, ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Cumin', quantity: 1, measurement: 'Tablespoon', ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Coconut sugar', quantity: 4, measurement: 'Tablespoon', ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Chicken Breast', quantity: 2, ingredientable_id: schnitzel.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Panko', quantity: 3, measurement: 'Cup', ingredientable_id: schnitzel.id, ingredientable_type: 'Entree')

puts "Creating eight groceries..."

Grocery.create!(name: 'Onion')
Grocery.create!(name: 'Steak')
Grocery.create!(name: 'Baked Potatoes')
Grocery.create!(name: 'Asparagus')
Grocery.create!(name: 'Celery Stalks')
Grocery.create!(name: 'Bell Pepper')
Grocery.create!(name: "Uncle Ben's Rice")
Grocery.create!(name: 'Sausage')

puts "Creating measurements..."

Measurement.create!(measure: 'Quarter Teaspoon')
Measurement.create!(measure: 'Half Teaspoon')
Measurement.create!(measure: 'Three-quarters Teaspoon')
Measurement.create!(measure: 'Teaspoon')
Measurement.create!(measure: 'Quarter Tablespoon')
Measurement.create!(measure: 'Half Tablespoon')
Measurement.create!(measure: 'Three-quarters Tablespoon')
Measurement.create!(measure: 'Tablespoon')
Measurement.create!(measure: 'Quarter Cup')
Measurement.create!(measure: 'Half Cup')
Measurement.create!(measure: 'Three-quarters Cup')
Measurement.create!(measure: 'Cup')
Measurement.create!(measure: 'Grams')
Measurement.create!(measure: 'Pinch')
Measurement.create!(measure: 'Quarter')
Measurement.create!(measure: 'Half')
Measurement.create!(measure: 'Three-quarters')

puts 'Creating a GroceryList...'

GroceryList.create!

puts "Seeds complete."
