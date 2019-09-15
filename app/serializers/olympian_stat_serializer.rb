class OlympianStatSerializer
  include FastJsonapi::ObjectSerializer
  set_type :olympian_stats
  set_id :id

  attributes :total_competing_olympians,
             :average_height,
             :average_weight,
             :average_age
end
