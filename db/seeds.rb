# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating three users..."

if Rails.env.development?
  jim = User.create!(email: 'jim@pubgrub.com', fname: 'Jim', role: :admin, password: 'password', calorie_goal: 2000)
  dana = User.create!(email: 'dana@pubgrub.com', fname: 'Dana', role: :admin, password: 'password', calorie_goal: 1300)
  User.create!(email: 'someguy@somewhere.com', fname: 'Dave', role: :member, password: 'password', calorie_goal: 1800)
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
carib = SideCategory.create!(name: 'Carribean')

puts "Creating eight entreees..."

steak = Entree.create!(name: 'Steak', cuisine_id: american.id, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [starch.id, bread.id])
jambalaya = Entree.create!(name: 'Jambalaya', cuisine_id: cajun.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
stew = Entree.create!(name: 'Beef Stew', cuisine_id: american.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
goj_chx = Entree.create!(name: 'Gochujang Chicken', cuisine_id: asian_food.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
saus = Entree.create!(name: 'Sausage and Potatoes', cuisine_id: german.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
cpc = Entree.create!(name: 'Coconut Peanut Chicken', cuisine_id: asian_food.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
carib_chx = Entree.create!(name: 'Caribbean Chicken', cuisine_id: caribbean.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [carib.id, carib.id])
schnitzel = Entree.create!(name: 'Chicken Schnitzel', cuisine_id: german.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 2, side_category_ids: [vege.id, german_cat.id])
freezer_meal = Entree.create!(name: 'Frozen Pan Dinner', cuisine_id: german.id, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: 0, present_sides: [],
               number_of_sides: 0, side_category_ids: [])
takeout = Entree.create!(name: 'Takeout!', cuisine_id: german.id, user_id: User.find_by(email: 'jim@pubgrub.com').id, status: 0, present_sides: [],
          number_of_sides: 0, side_category_ids: [])
general = Entree.create!(name: "General Tso's Chicken", cuisine_id: asian.id, user_id: User.find_by(email: 'dana@pubgrub.com').id, status: 0, present_sides: [],
          number_of_sides: 0, side_category_ids: [])

puts "Creating eight sides..."

bp = Side.create!(name: 'Baked Potato', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: starch.id)
mp = Side.create!(name: 'Mashed Potatoes', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: starch.id)
ses = Side.create!(name: 'Sesame Green Breans', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: asian.id)
ed = Side.create!(name: 'Edamame', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: asian.id)
mx = Side.create!(name: 'Mixed Frozen Vege', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: vege.id)
asp = Side.create!(name: 'Asparagus', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: vege.id)
fb = Side.create!(name: 'French Bread', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: bread.id)
gb = Side.create!(name: 'Garlic Bread', user_id: User.find_by(email: 'jim@pubgrub.com').id, side_category_id: bread.id)
crabe = Side.create!(name: 'Plaintain', user_id: User.find_by(email: 'dana@pubgrub.com').id, side_category_id: carib.id)
craberice = Side.create!(name: 'Coconut Rice', user_id: User.find_by(email: 'dana@pubgrub.com').id, side_category_id: carib.id)

puts "Creating forty groceries..."

nysteak = Grocery.create!(name: 'Steak', calories_per_gram: 1.17)
uben = Grocery.create!(name: "Uncle Ben's rice", grams_per_package: 250, calories_per_package: 380, calories_per_gram: 1.52)
kb = Grocery.create!(name: 'Kidney Beans', grams_per_package: 250, calories_per_package: 277, calories_per_gram: 1.1)
cel = Grocery.create!(name: 'celery', calories_per_gram: 0.14)
rp = Grocery.create!(name: 'red pepper', calories_per_gram: 0.31)
sb = Grocery.create!(name: 'Stew Beef', calories_per_gram: 2.5)
carrot = Grocery.create!(name: 'Carrots', calories_per_gram: 0.41)
onion = Grocery.create!(name: 'Onion', calories_per_gram: 0.4)
fchx = Grocery.create!(name: 'Full Chicken', calories_per_gram: 1.8)
goj = Grocery.create!(name: 'Gochujang Paste', calories_per_gram: 2.23)
smpo = Grocery.create!(name: 'Small potatoes', calories_per_gram: 0.77)
ssaus = Grocery.create!(name: 'Sweet Sausage', calories_per_gram: 3.37)
peanuts = Grocery.create!(name: 'Peanuts', grams_per_package: 300, calories_per_package: 185400, calories_per_gram: 6.18)
chxbr = Grocery.create!(name: 'Chicken Breast', calories_per_gram: 1.65)
cocomlk = Grocery.create!(name: 'Coconut Milk', calories_per_gram: 2)
plant = Grocery.create!(name: 'Plantain', calories_per_gram: 1.22)
cumin = Grocery.create!(name: 'Cumin', calories_per_gram: 3.75)
cocosug = Grocery.create!(name: 'Coconut Sugar', calories_per_gram: 1.36)
panko = Grocery.create!(name: 'Panko', calories_per_gram: 3.95)
soy = Grocery.create!(name: 'Soy Sauce', calories_per_gram: 0.53)
rwine = Grocery.create!(name: 'Rice Wine', calories_per_gram: 1.34)
cstarch = Grocery.create!(name: 'Cornstarch', calories_per_gram: 3.82)
voil = Grocery.create!(name: 'Vegetable Oil', calories_per_gram: 8.84)
garlic = Grocery.create!(name: 'Garlic', calories_per_gram: 1.5)
ginger = Grocery.create!(name: 'Ginger', calories_per_gram: 0.8)
dchili = Grocery.create!(name: 'Dried Chilis', calories_per_gram: 0.4)
rwinev = Grocery.create!(name: 'Rice Wine Vinegar', calories_per_gram: 0)
sugar = Grocery.create!(name: 'Sugar', calories_per_gram: 3.87)
hoi = Grocery.create!(name: 'Hoisin Sauce', calories_per_gram: 2.2)
scal = Grocery.create!(name: 'Scallions', calories_per_gram: 0.32)
sseeds = Grocery.create!(name: 'Sesame Seeds', calories_per_gram: 5.73)
evoo = Grocery.create!(name: 'Olive Oil', calories_per_gram: 9)
idaho = Grocery.create!(name: 'Idaho Potato', calories_per_gram: 0.75)
mash = Grocery.create!(name: 'Mashed Potato', calories_per_gram: 2)
sesgreen = Grocery.create!(name: 'Sesame Green Beans', calories_per_gram: 1.5)
edam = Grocery.create!(name: 'Edamame', calories_per_gram: 1)
fveg = Grocery.create!(name: 'Frozen Mixed Vegetables', calories_per_gram: 0.75)
aspar = Grocery.create!(name: 'Asparagus', calories_per_gram: 0.2)
fbread = Grocery.create!(name: 'French Bread', calories_per_gram: 2.6)
gbread = Grocery.create!(name: 'Garlic Bread', calories_per_gram: 3.75)
irtea = Grocery.create!(name: 'Twinings Irish Breakfast Tea', calories_per_gram: 0)
engtea = Grocery.create!(name: 'Twinings English Breakfast Tea', calories_per_gram: 0)
kidbread = Grocery.create!(name: 'Kid Bread', calories_per_gram: 3)
adult = Grocery.create!(name: 'Adult Bread', calories_per_gram: 3)
rus = Grocery.create!(name: 'Russian Bread', calories_per_gram: 3.95)

puts "Creating thirty-seven ingredients..."

Ingredient.create!(grocery_id: nysteak.id, quantity: 1, measurement: 'NY Strip', ingredientable_id: steak.id, ingredientable_type: 'Entree', total_grams: 345)
Ingredient.create!(grocery_id: uben.id, quantity: 1, measurement: 'bag', ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: kb.id, quantity: 1, measurement: "can", ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cel.id, quantity: 1, measurement: 'stalk', ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: rp.id, quantity: 1, ingredientable_id: jambalaya.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: sb.id, quantity: 2, measurement: 'pound', ingredientable_id: stew.id, ingredientable_type: 'Entree', total_grams: 907)
Ingredient.create!(grocery_id: carrot.id, quantity: 4, measurement: 'bunch', ingredientable_id: stew.id, ingredientable_type: 'Entree', total_grams: 240)
Ingredient.create!(grocery_id: onion.id, quantity: 1, ingredientable_id: stew.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: fchx.id, quantity: 1, ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: goj.id, quantity: 5, measurement: 'Tablespoons', ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: ssaus.id, quantity: 1, measurement: 'pound', ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: onion.id, quantity: 1, ingredientable_id: goj_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: ssaus.id, quantity: 1, measurement: 'pound', ingredientable_id: saus.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: smpo.id, quantity: 1, measurement: 'pound', ingredientable_id: saus.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: peanuts.id, quantity: 2, measurement: 'Cups', ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: chxbr.id, quantity: 2, ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cocomlk.id, quantity: 1, measurement: 'Can', ingredientable_id: cpc.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: chxbr.id, quantity: 2, ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: plant.id, quantity: 1, ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cumin.id, quantity: 1, measurement: 'Tablespoon', ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cocosug.id, quantity: 4, measurement: 'Tablespoon', ingredientable_id: carib_chx.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: chxbr.id, quantity: 2, ingredientable_id: schnitzel.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: panko.id, quantity: 3, measurement: 'Cup', ingredientable_id: schnitzel.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: chxbr.id, quantity: 2, measurement: 'Pounds', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: soy.id, quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: rwine.id, quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cstarch.id, quantity: 0.5, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: cstarch.id, quantity: 1, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: voil.id, quantity: 2, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: garlic.id, quantity: 2, measurement: 'Clove', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: ginger.id, quantity: 1, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: dchili.id, quantity: 12, ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: rwinev.id, quantity: 0.25, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: sugar.id, quantity: 0.25, measurement: 'Cup', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: hoi.id, quantity: 2, measurement: 'Tablespoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: scal.id, quantity: 2, ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: sseeds.id, quantity: 1, measurement: 'Teaspoon', ingredientable_id: general.id, ingredientable_type: 'Entree')
Ingredient.create!(grocery_id: idaho.id, quantity: 1, ingredientable_id: bp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: mash.id, quantity: 1, ingredientable_id: mp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: sesgreen.id, quantity: 1, ingredientable_id: ses.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: edam.id, quantity: 1, measurement: 'bag', ingredientable_id: ed.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: fveg.id, quantity: 1, measurement: 'bag', ingredientable_id: mx.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: aspar.id, quantity: 1, ingredientable_id: asp.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: fbread.id, quantity: 1, measurement: 'loaf', ingredientable_id: fb.id, ingredientable_type: 'Side')
Ingredient.create!(grocery_id: gbread.id, quantity: 1, measurement: 'loaf', ingredientable_id: gb.id, ingredientable_type: 'Side')

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
bag = Measurement.create!(measure: 'Bag')
Measurement.create!(measure: 'Can')
Measurement.create!(measure: 'Stalk')
Measurement.create!(measure: 'Bunch')
Measurement.create!(measure: 'Pound')
Measurement.create!(measure: 'Clove')
box = Measurement.create!(measure: 'Box')
loaf = Measurement.create!(measure: 'Loaf')

puts "Creating five staples..."

Staple.create!(grocery_id: irtea.id, measurement_id: box.id, quantity: 1,
               user_id: User.find_by(email: 'jim@pubgrub.com').id,
               status: :in_stock)
Staple.create!(grocery_id: engtea.id,
               measurement_id: box.id, quantity: 1,
               user_id: User.find_by(email: 'jim@pubgrub.com').id,
               status: :in_stock)
Staple.create!(grocery_id: kidbread.id, measurement_id: loaf.id, quantity: 1,
               user_id: User.find_by(email: 'jim@pubgrub.com').id,
               status: :in_stock,
               grams_per_package: 500, calories_per_package: 1325)
Staple.create!(grocery_id: adult.id, measurement_id: loaf.id, quantity: 1,
               user_id: User.find_by(email: 'jim@pubgrub.com').id,
               status: :in_stock,
               grams_per_package: 500, calories_per_package: 1340)
Staple.create!(grocery_id: rus.id, measurement_id: bag.id, quantity: 1,
               user_id: User.find_by(email: 'jim@pubgrub.com').id,
               status: :in_stock,
               grams_per_package: 100, calories_per_package: 3.95)

puts "Creating recipes for entrees..."

Recipe.create!(recipeable_id: steak.id, recipeable_type: 'Entree', user_id: steak.user_id, body: 'This is steak. Grill it.')
Recipe.create!(recipeable_id: jambalaya.id, recipeable_type: 'Entree', user_id: jambalaya.user_id, body: 'Basically just a big pan.')
Recipe.create!(recipeable_id: stew.id, recipeable_type: 'Entree', user_id: stew.user_id, body: 'Instant Pot, yo.')
Recipe.create!(recipeable_id: goj_chx.id, recipeable_type: 'Entree', user_id: goj_chx.user_id, body: 'Order it out, maybe?')
Recipe.create!(recipeable_id: saus.id, recipeable_type: 'Entree', user_id: saus.user_id, body: 'Definitely uses a pan.')
Recipe.create!(recipeable_id: cpc.id, recipeable_type: 'Entree', user_id: cpc.user_id, body: 'Ask Dana.')
Recipe.create!(recipeable_id: carib_chx.id, recipeable_type: 'Entree', user_id: carib_chx.user_id, body: 'You need a grill pan to start.')
Recipe.create!(recipeable_id: schnitzel.id, recipeable_type: 'Entree', user_id: schnitzel.user_id, body: 'Definitely ask Dana.')
Recipe.create!(recipeable_id: freezer_meal.id, recipeable_type: 'Entree', user_id: freezer_meal.user_id, body: 'Dump it out, stove at 7.')
Recipe.create!(recipeable_id: takeout.id, recipeable_type: 'Entree', user_id: takeout.user_id, body: 'Liferando will help here.')
Recipe.create!(recipeable_id: general.id, recipeable_type: 'Entree', user_id: general.user_id, body: 'Still looking for a good recipe for this.')

puts "Creating recipes for sides..."

Recipe.create!(recipeable_id: bp.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Oven at 350F or 176C.')
Recipe.create!(recipeable_id: mp.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Boil then mash with butter.')
Recipe.create!(recipeable_id: ses.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Ask Dana for real.')
Recipe.create!(recipeable_id: ed.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Put the thing in the microwave or boil it.')
Recipe.create!(recipeable_id: mx.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Microwave.')
Recipe.create!(recipeable_id: asp.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Oil and a pan.')
Recipe.create!(recipeable_id: fb.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Get this from a bakery.')
Recipe.create!(recipeable_id: gb.id, recipeable_type: 'Side', user_id: User.find_by(email: 'jim@pubgrub.com').id, body: 'Oven. Texas Toast is preferable.')

puts "Creating ten condiments..."

Condiment.create!(name: 'Butter', calories_per_gram: 7.17)
Condiment.create!(name: 'Bacon Bits', calories_per_gram: 4.71)
Condiment.create!(name: 'Heinz Ketchup', calories_per_gram: 1.4)
Condiment.create!(name: 'Mustard', calories_per_gram: 0.66)
Condiment.create!(name: 'Thomy Mayonnaise', calories_per_gram: 7.21)

puts "Running RandomizeCurrentEntreesJob..."

RandomizeCurrentEntreesJob.new.perform_now

puts 'Creating a GroceryList...'

GroceryList.create!

puts 'Creating some food logs'

user_ids = [
  User.find_by(email: 'jim@pubgrub.com').id,
  User.find_by(email: 'dana@pubgrub.com').id,
  User.find_by(email: 'someguy@somewhere.com').id
]

entree_ids = Entree.pluck(:id)

15.times do
  user_ids.each do |id|
    FoodLog.create!(user_id: id, entree_calories: Faker::Number.number(digits: 3),
                    side_calories: [Faker::Number.number(digits: 2), Faker::Number.number(digits: 3)],
                    entree_id: entree_ids.sample
                  )
  end
end


puts "Seeds complete."
