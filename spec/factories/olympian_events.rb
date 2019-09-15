FactoryBot.define do
  factory :olympian_event do
    medals = [
      'Bronze', 'Silver',
      'Gold',   'NA'
    ]

    olympian
    event
    medal { medals.sample }
  end
end
