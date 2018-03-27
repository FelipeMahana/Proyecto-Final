# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Plan.create(price: 60, duration: 1, contract_type: 1, description: Faker::Lorem.paragraph, discount:, date_start:)
Plan.destroy_all
#plan 1 mes entrenamiento solo
Plan.create(price: 60, duration: 1, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 1 mes nutricion sola
Plan.create(price: 60, duration: 1, contract_type: 2, description: Faker::Lorem.paragraph)
#plan 1 mes entrenamiento y nutricion

Plan.create(price: 110, duration: 1, contract_type: 3, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento solo
Plan.create(price: 160, duration: 3, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 3 meses nutricion  sola
Plan.create(price: 160, duration: 3, contract_type: 2, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento y nutricion
Plan.create(price: 300, duration: 3, contract_type: 3, description: Faker::Lorem.paragraph)



