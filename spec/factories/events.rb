FactoryBot.define do
  events = [
    "Gymnastics Men's Rings",             "Gymnastics Men's Pommelled Horse",
    "Athletics Women's 5,000 metres",     "Rowing Men's Coxless Pairs",
    "Taekwondo Women's Flyweight",        "Handball Men's Handball",
    "Boxing Women's Middleweight",        "Athletics Men's 400 metres",
    "Handball Women's Handball",          "Cycling Women's Road Race",
    "Diving Women's Platform",            "Shooting Men's Air Pistol",
    "Shooting Men's Free Pistol",         "Shooting Women's Air Rifle",
    "Boxing Men's Lightweight",           "Judo Men's Half-Middleweight",
    "Weightlifting Women's Middleweight", "Weightlifting Men's Middle-Heavyweight",
    "Football Men's Football",            "Synchronized Swimming Women's Team",
    "Judo Men's Extra-Lightweight",       "Wrestling Men's Middleweight, Greco-Roman",
    "Athletics Men's 10,000 metres",      "Volleyball Women's Volleyball"
  ]

  factory :event do
    sport
    name { events.pop }
  end
end
