FactoryBot.define do
  factory :event do
    sport
    name { Faker::Lorem.words(number: 4) }
  end
end
