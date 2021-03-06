FactoryBot.define do
  factory :book do
    genre       { Faker::Book.genre }
    author      { Faker::Book.author }
    cover_image { Faker::Avatar.image }
    title       { Faker::Book.title }
    publisher   { Faker::Book.publisher }
    year        { Faker::Date.backward(25).year }
  end
end
