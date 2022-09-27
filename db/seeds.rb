# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "++++++Populating database with development data+++++++"

## Defining model factoris 
FactoryBot.define do
  factory :author do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    title      { Faker::Lorem.word }
  end

  factory :customer do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    title       { Faker::Lorem.word }
    email       { Faker::Internet.email }
    visits      { Faker::Lorem.word }
    order_count { 0 }
  end

  factory :supplier do
    name  { Faker::Name.name }
  end

  factory :book do
    title { Faker::Book.title }
    year_published
  end

  factory :review do 
    title { Faker::review.title}
    body  {Faker::review.body}
    rating {Faker::review.rating}
    state  { Faker::review.state}
end
# customer
# book

factory :order do 
  date_submitted {Faker::order.date_submitted}
  status {Faker::order.status}
  subtotal {Faker::order.subtotal}
  shipping {Faker::order.shipping}
end
end

100.times do 
  Author.create({ 
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
  })
end
## driver logic
# years = (1990...2022).to_a

puts FactoryBot.create :author
# puts FactoryBot.create :customer
# puts FactoryBot.create :supplier
#  putsFactoryBot.create :reviews
# putsFactoryBot.create: order
