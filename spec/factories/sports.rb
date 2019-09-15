FactoryBot.define do
  factory :sport do
    name { Faker::Lorem.words(number: 4) }
  end
end
