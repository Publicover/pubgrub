# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating three users..."

User.create!(email: 'jim@pubgrub.com', fname: 'Jim', role: :admin, password: 'password')
User.create!(email: 'dana@pubgrub.com', fname: 'Dana', role: :admin, password: 'password')
User.create!(email: 'someguy@somewhere.com', fname: 'Dave', role: :member, password: 'password')

puts "Creating two meals..."

Meal.create(name: 'Steak', cuisine: 'American', user_id: User.find_by(email: 'jim@pubgrub.com').id)
Meal.create(name: 'Beet Pasta', cuisine: 'Mom', user_id: User.find_by(email: 'dana@pubgrub.com').id)

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

puts "Seeds complete."
