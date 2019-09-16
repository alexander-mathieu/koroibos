class TeamMedalCountSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  set_id :id

  attributes :team_medalists
end
