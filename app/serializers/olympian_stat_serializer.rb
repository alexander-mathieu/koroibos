class OlympianStatSerializer
  include FastJsonapi::ObjectSerializer
  set_type :olympian_stats
  set_id :id

  attribute :total_competing_olympians

  attribute :average_age do |object|
    object.average_age.round(2)
  end

  attribute :average_height do |object|
    {
      unit: 'cm',
      female_olympians: object.average_height[:female_olympians].round(2),
      male_olympians: object.average_height[:male_olympians].round(2)
    }
  end

  attribute :average_weight do |object|
    {
      unit: 'kg',
      female_olympians: object.average_weight[:female_olympians].round(2),
      male_olympians: object.average_weight[:male_olympians].round(2)
    }
  end
end
