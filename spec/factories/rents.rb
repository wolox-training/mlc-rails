FactoryBot.define do
  factory :rent do
    user { nil }
    book { nil }
    start_date { 'MyString' }
    end_date { 'MyString' }
  end
end
