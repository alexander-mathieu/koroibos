FactoryBot.define do
  factory :sport do
    sports = [
      'Weightlifting', 'Gymnastics',
      'Athletics',     'Rowing',
      'Taekwondo',     'Boxing',
      'Equestrianism', 'Cycling'
    ]

    name { sports.sample }
  end
end
