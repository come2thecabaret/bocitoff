# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do
  User.create!(
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password(8)

  )
end
users = User.all

500.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.sentence
  )
end

puts "Seeded!"
puts "#{User.count} users created"
puts "#{Item.count} items created"
