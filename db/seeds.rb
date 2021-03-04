# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating three users..."

if Rails.env.development?
  jim = User.create!(email: 'jim@pubgrub.com', fname: 'Jim', role: :admin, password: 'password')
  dana = User.create!(email: 'dana@pubgrub.com', fname: 'Dana', role: :admin, password: 'password')
  User.create!(email: 'someguy@somewhere.com', fname: 'Dave', role: :member, password: 'password')
end

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
freezer_meal = Entree.create!(name: 'Frozen Pan Dinner', cuisine_id: german.id, user_id: jim.id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
takeout = Entree.create!(name: 'Takeout!', cuisine_id: german.id, user_id: jim.id, status: 0, present_sides: [],
          number_of_sides: 0, side_category_ids: [])
general = Entree.create!(name: "General Tso's Chicken", cuisine_id: asian.id, user_id: dana.id, status: 0, present_sides: [],
          number_of_sides: 0, side_category_ids: [])

puts "Creating eight sides..."

bp = Side.create!(name: 'Baked Potato', user_id: jim.id, side_category_id: starch.id)
mp = Side.create!(name: 'Mashed Potatoes', user_id: jim.id, side_category_id: starch.id)
ses = Side.create!(name: 'Sesame Green Breans', user_id: jim.id, side_category_id: asian.id)
ed = Side.create!(name: 'Edamame', user_id: jim.id, side_category_id: asian.id)
mx = Side.create!(name: 'Mixed Frozen Vege', user_id: jim.id, side_category_id: vege.id)
asp = Side.create!(name: 'Asparagus', user_id: jim.id, side_category_id: vege.id)
fb = Side.create!(name: 'French Bread', user_id: jim.id, side_category_id: bread.id)
gb = Side.create!(name: 'Garlic Bread', user_id: jim.id, side_category_id: bread.id)

puts "Creating thirty-seven ingredients..."

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
Ingredient.create!(grocery: 'Chicken Breast', quantity: 2, measurement: 'Pounds', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Soy Sauce', quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Rice Wine', quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Cornstarch', quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Cornstarch', quantity: 1, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Vegetable Oil', quantity: 2, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Garlic', quantity: 2, measurement: 'Clove', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Ginger', quantity: 1, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Dried Chilis', quantity: 12, ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Rice Wine Vinegar', quantity: 0.25, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Sugar', quantity: 0.25, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Hoisin Sauce', quantity: 2, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Scallions', quantity: 2, ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'Sesame Seeds', quantity: 1, measurement: 'Teaspoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery: 'baked potato', quantity: 1, ingredientable_id: bp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'mashed potatoe', quantity: 1, ingredientable_id: mp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'sesame green beans', quantity: 1, ingredientable_id: ses.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'Edamame', quantity: 1, measurement: 'bag', ingredientable_id: ed.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'Frozen Vege', quantity: 1, measurement: 'bag', ingredientable_id: mx.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'Asparagus', quantity: 1, ingredientable_id: asp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'French Bread', quantity: 1, measurement: 'loaf', ingredientable_id: fb.id, ingredientable_type: 'Side')
Ingredient.create!(grocery: 'Garlic Bread', quantity: 1, measurement: 'loaf', ingredientable_id: gb.id, ingredientable_type: 'Side')

puts "Creating thirty groceries..."

Grocery.create!(name: 'Steak')
Grocery.create!(name: "Uncle Ben's rice")
Grocery.create!(name: 'Kidney Beans')
Grocery.create!(name: 'celery')
Grocery.create!(name: 'red pepper')
Grocery.create!(name: 'stew beef')
Grocery.create!(name: 'carrots')
Grocery.create!(name: 'onion')
Grocery.create!(name: 'Full Chicken')
Grocery.create!(name: 'Gochujang Paste')
Grocery.create!(name: 'Small potatoes')
Grocery.create!(name: 'peanuts')
Grocery.create!(name: 'chicken breast')
Grocery.create!(name: 'coconut milk')
Grocery.create!(name: 'plantain')
Grocery.create!(name: 'cumin')
Grocery.create!(name: 'coconut sugar')
Grocery.create!(name: 'Panko')
Grocery.create!(name: 'Soy Sauce')
Grocery.create!(name: 'Rice Wine')
Grocery.create!(name: 'Cornstarch')
Grocery.create!(name: 'Vegetable Oil')
Grocery.create!(name: 'Garlic')
Grocery.create!(name: 'Ginger')
Grocery.create!(name: 'Dried Chilis')
Grocery.create!(name: 'Rice Wine Vinegar')
Grocery.create!(name: 'Sugar')
Grocery.create!(name: 'Hoisin Sauce')
Grocery.create!(name: 'Scallions')
Grocery.create!(name: 'Sesame Seeds')


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
Measurement.create!(measure: 'NY Strip')
Measurement.create!(measure: 'bag')
Measurement.create!(measure: 'can')
Measurement.create!(measure: 'stalk')
Measurement.create!(measure: 'bunch')
Measurement.create!(measure: 'Pound')
Measurement.create!(measure: 'Clove')

puts "Creating five staples..."

Staple.create!(name: 'Twinings Tea', measurement: 'box', quantity: 1, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: :in_stock)
Staple.create!(name: 'English Breakfast Tea', measurement: 'box', quantity: 1, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: :in_stock)
Staple.create!(name: 'Kid Bread', measurement: 'Loaf', quantity: 1, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: :in_stock)
Staple.create!(name: 'Adult Bread', measurement: 'Loaf', quantity: 1, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: :in_stock)
Staple.create!(name: 'Russian Bread', measurement: 'Bag', quantity: 1, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: :in_stock)

puts "Running RandomizeCurrentEntreesJob..."

RandomizeCurrentEntreesJob.new.perform_now

puts 'Creating a GroceryList...'

GroceryList.create!

puts "Seeds complete."
