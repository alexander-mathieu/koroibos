class EventParticipationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  set_id :id

  attribute :team_participation
end
