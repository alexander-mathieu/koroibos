FactoryBot.define do
  medals = [
    'Bronze', 'Silver',
    'Gold',   'NA'
  ]

  factory :olympian_event do
    olympian
    event
    medal { medals.sample }
  end

  factory :olympian_event_with_medal, parent: :olympian_event do
    medals = medals - ['NA']

    medal { medals.sample }
  end

  factory :olympian_event_without_medal, parent: :olympian_event do
    medal { 'NA' }
  end
end
