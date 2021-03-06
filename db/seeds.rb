
User.create!(first_name: "First", last_name: "Last", email: "test@test.com", password: "password")

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
  )
end

6.times do
  Trip.create!(
    name: Faker::Lorem.sentence(word_count: 3),
    start_date: DateTime.new(2019,9,1,17),
    end_date: DateTime.new(2019,10,1,17),
    user_id: rand(1..6)
  )
end

6.times do
  Location.create!(
    name: Faker::Address.country,
    days: rand(1..10),
    trip_id: rand(1..5)
  )
end

location_records = Location.all
location_records.each do |record|
  Address.create!(
    street: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    location_id: record.id
  )
end
puts "Database successfully seeded."