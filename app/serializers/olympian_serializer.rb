class OlympianSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :age,
             :name,
             :sports,
             :team

  attribute :total_medal_count do |object|
    object.total_medal_count
  end
end
