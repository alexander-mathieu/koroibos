FactoryBot.define do
  factory :olympian_event do
    medals = [
      'Bronze', 'Silver',
      'Gold',   'NA'
    ]

    olympian
    medal { medals.sample }
  end
end
