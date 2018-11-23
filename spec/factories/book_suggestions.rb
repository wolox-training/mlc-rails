FactoryBot.define do
  factory :book_suggestion do
    synopsis    { Faker::Lorem.sentence }
    price       { Faker::Number.number(2) }
    link        { Faker::Internet.url }
    author      { Faker::Book.author }
    title       { Faker::Book.title }
    publisher   { Faker::Book.publisher }
    year        { Faker::Date.backward(25).year }
    user        { create(:user) }
  end
end
