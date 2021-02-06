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

puts "Creating four groceries..."

Grocery.create!(name: 'Onion')
Grocery.create!(name: 'Steak')
Grocery.create!(name: 'Baked Potatoes')
Grocery.create!(name: 'Asparagus')

puts "Seeds complete."
