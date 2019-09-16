class MedalCountSerializer
  include FastJsonapi::ObjectSerializer
  set_type :teams
  set_id :id

  attributes :team_medalists
end
