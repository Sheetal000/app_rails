# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "++++++Populating database with development data+++++++"
## methods

def random_year
  years = (1990...2022).to_a
  years[Random.rand(30)]
end

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
    year_published { random_year }
    isbn { Faker::IDNumber.south_african_id_number }
    price { Random.rand(2000) }
    out_of_print {false}

    ## association
    author
    supplier
  end

  factory :review do 
    title { Faker::Marketing.buzzwords }
    body  { Faker::Marketing.buzzwords }
    rating { Random.rand(7) }
    state  { Random.rand(20) }

    ## assocation
    customer
    book
  end

  factory :order do 
    date_submitted { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    status { Random.rand(3)}
    subtotal { Random.rand(5000.00) }
    shipping { Random.rand(500.00) }
    tax { Random.rand(400.00) }
    total { Random.rand(Random.rand(7000.00)) }
  
    ## asocation
    customer
  end

end

## driver logic
# years = (1990...2022).to_a
  100.times do
    puts "\n++++++ Populating authors+++++++" 
    FactoryBot.create :author

    puts "\n+++++++ Poulting customers+++++"
    FactoryBot.create :customer

    puts "\n++++++++++ Populating supplier +++++++++++"
    FactoryBot.create :supplier

    puts "\n++++++++++++Poulating Books+++++++++++++"
    FactoryBot.create :book

    puts "\n++++++++++++Poulating Order +++++++++++++"
    FactoryBot.create :order
    
    puts "\n++++++++++++Poulating Order +++++++++++++"
    FactoryBot.create :review

    puts "================================================="
    puts "Seeding completed"
    puts "================================================="

    puts "\ntotal tables seeds count"
    puts "Author: #{Author.count}"
    puts "Customer: #{Customer.count}"
    puts "Supplier: #{Supplier.count}"
    puts "Book: #{Book.count}"
    puts "Order: #{Order.count}"
    puts "review: #{Review.count}"


end
