FactoryBot.define do
  factory :book_suggestion do
    synopsis { "MyString" }
    price { 1.5 }
    author { "MyString" }
    title { "MyString" }
    link { "MyString" }
    publisher { "MyString" }
    year { "MyString" }
    user { nil }
  end
end
