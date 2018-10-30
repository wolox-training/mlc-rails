FactoryBot.define do
  factory :book do
    genre       { Faker::Book.genre }
    author      { Faker::Book.author }
    cover_image { 'image.jpg' }
    title       { Faker::Book.title }
    publisher   { Faker::Book.publisher }
    year        { Faker::Date.backward(25).year }
  end

  factory :user do
    first_name  { Faker::Name.first_name }
    last_name               { Faker::Name.last_name }
    email                   { Faker::Internet.email(last_name) }
    password                { Faker::Internet.password }
    password_confirmation   { password }
  end
end
