# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'jim@pubgrub.com', fname: 'Jim', role: :admin, password: 'password')
User.create!(email: 'dana@pubgrub.com', fname: 'Dana', role: :admin, password: 'password')
User.create!(email: 'someguy@somewhere.com', fname: 'Dave', role: :user, password: 'password')
