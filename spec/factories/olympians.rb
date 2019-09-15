FactoryBot.define do
  sexes = [ "M", "F" ]

  factory :olympian do
    team
    name { Faker::Name.unique.name }
    sex { sexes.sample }
    age { rand(16..40) }
    height { rand(160..210) }
    weight { rand(50..130) }
  end
end
