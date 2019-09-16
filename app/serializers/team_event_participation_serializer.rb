class TeamEventParticipationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  set_id :id

  attribute :team_event_participation
end
