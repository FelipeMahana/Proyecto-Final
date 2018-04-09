# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plan.destroy_all
Contract.destroy_all
User.destroy_all
Billing.destroy_all
Program.destroy_all


### ~~~~Creacion Planes~~~~ ###
#~Necesario creacion los planes de entrenamiento, estos deben contener datos estaticos, en caso de actualizar precios, el seed debe ser cambiado~#
#Plan.create(price: (precio del plan), duration: (duracion en meses del plan), contract_type: ((valor de 1 a 3), describe si el plan es rutina entrenamiento, plan nutricional o ambos), description: (Descripcion del plan a contratar(en que consiste)))

#plan 1 mes entrenamiento solo
plan1 = Plan.create(price: 60, duration: 1, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 1 mes nutricion sola
plan2 = Plan.create(price: 60, duration: 1, contract_type: 2, description: Faker::Lorem.paragraph)
#plan 1 mes entrenamiento y nutricion

plan3 = Plan.create(price: 110, duration: 1, contract_type: 3, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento solo
plan4 = Plan.create(price: 160, duration: 3, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 3 meses nutricion  sola
plan5 = Plan.create(price: 160, duration: 3, contract_type: 2, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento y nutricion
plan6 = Plan.create(price: 300, duration: 3, contract_type: 3, description: Faker::Lorem.paragraph)

###Creacion de usuario admin/profesor###
User.create(name: "admin", email: "admin@gmail.com", password: "123123", role: 'admin')

### ~~~~Creacion contenido generico contrato~~~~ ###
#Contract.create(weight: (peso en kg), height: (altura en cms), activity_level: (nivel de actividad fisica, valor entre 1 a 5),goal: (texto cualquiera, soporta text), disease: (texto cualquiera, largo string), allergies: (texto cualquiera, largo string), bmr(este es para randomizar el valor calorico diario, en teoria se calcula con los datos que entrega el cliente, pero un rango entre 2000 y 3000 es resultado esperable),age: (edad, valores positivos),sex: (valor entre 1 y 2, donde 1 es hombre y 2 es mujer),pending: true(true significa que se a generado el contrato, necesario para poder hacer un programa))
15.times do |i|
	usuario = User.create(name: "usuario#{i}", email: "usuario#{i}@gmail.com", password: "123123")
	contrato = Contract.create(weight: rand(30..150), height: rand(60..230), activity_level: rand(1..5),goal: Faker::Lorem.paragraph, disease: Faker::Lorem.word, allergies: Faker::Lorem.word, bmr: rand(2000..3000), age: rand(10..100), sex:rand(1..2), pending: true, user: usuario, plan: plan3)
end

### ~~~~Nota~~~~ ###
#Como ejemplo solo se genera el contrato con un plan, suficiente para porbar
#El resto de los modelo, segun la logica de negocio, no se deberian crear por seed
