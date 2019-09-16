class OlympianSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :age,
             :name,
             :sports,
             :team,
             :total_medal_count
end
