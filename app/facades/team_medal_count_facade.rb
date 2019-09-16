class TeamMedalCountFacade
  attr_reader :id

  def initialize(teams)
    @id = nil
    @teams = teams
  end

  def team_medalists
    @teams.map do |team|
      {
        team: team.name,
        total_medal_count: team.total_medal_count,
        medals: {
          bronze: team.medal_count('Bronze'),
          silver: team.medal_count('Silver'),
          gold: team.medal_count('Gold')
        }
      }
    end
  end
end
