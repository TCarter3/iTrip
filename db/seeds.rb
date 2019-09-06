# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test@test.com", encrypted_password: "password")
5.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: "password"
  )
  Trip.create(
    name: Faker::Lorem.sentence(word_count: 3),
    user_id: rand(7)
  )
  Location.create(
    name: Faker::Address.country,
    days: rand(11),
    trip_id: rand(6)
  )
  location_records = Location.all
  location_records.each do |record|
    Address.create(
      street: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      location_id: record.id
    )
  end
end
puts "Database successfully seeded."