# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  { name: 'Glass', price: 2100 },
  { name: 'Mini', price: 800 },
  { name: 'XL', price: 1100 }
].each do |phone|
  Product.create(phone)
end
