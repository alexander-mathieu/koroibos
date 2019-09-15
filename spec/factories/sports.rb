FactoryBot.define do
  sports = [
    'Weightlifting', 'Gymnastics',
    'Athletics',     'Rowing',
    'Taekwondo',     'Boxing',
    'Equestrianism', 'Cycling',
    'Badminton',     'Rugby Sevens',
    'Table Tennis',  'Water Polo',
    'Trampolining',  'Basketball',
    'Triathlon',     'Modern Pentathlon',
    'Sailing',       'Beach Volleyball',
    'Golf',          'Rhythmic Gymnastics',
    'Hockey',        'Gymnastics',
    'Archery',       'Tennis'
  ]

  factory :sport do
    name { sports.pop }
  end
end
