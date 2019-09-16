class EventParticipationFacade
  attr_reader :id

  def initialize(teams)
    @id = nil
    @teams = teams
  end

  def team_participation
    @teams.map do |team|
      {
        team: team.name,
        event_participation: "#{Event.team_events(team.id).count} of #{Event.count} events",
        percentage: Event.team_participation_percentage(team.id),
        events: Event.team_events(team.id)
      }
    end
  end
end
