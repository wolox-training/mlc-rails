FactoryBot.define do
  factory :rent do
    user
    book
    start_date { Faker::Date.between(-20.days.from_now, -2.days.from_now) }
    end_date { Faker::Date.between(start_date, -1.day.from_now) }
  end
end
