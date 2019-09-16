require 'rails_helper'

RSpec.describe 'medal count endpoint' do
  it 'returns medal counts for each team' do
    t1 = create(:team)
    t2 = create(:team)

    o1 = create(:olympian, team: t1)
    o2 = create(:olympian, team: t1)
    o3 = create(:olympian, team: t2)
    o4 = create(:olympian, team: t2)

    e1 = create(:event, name: 'Event 1')
    e2 = create(:event, name: 'Event 2')
    e3 = create(:event, name: 'Event 3')
    e4 = create(:event, name: 'Event 4')

    create(:olympian_event_with_medal, event: e1, olympian: o1)
    create(:olympian_event_with_medal, event: e1, olympian: o2)
    create(:olympian_event_with_medal, event: e2, olympian: o1)
    create(:olympian_event_with_medal, event: e2, olympian: o2)
    create(:olympian_event_with_medal, event: e3, olympian: o3)
    create(:olympian_event_with_medal, event: e4, olympian: o4)

    get '/api/v1/medal_count'

    teams = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:team_medalists]
    team = teams[0]
    team_medals = team[:medals]

    expect(teams.count).to eq(2)

    expect(team).to have_key(:team)
    expect(team).to have_key(:total_medal_count)
    expect(team_medals).to have_key(:bronze)
    expect(team_medals).to have_key(:silver)
    expect(team_medals).to have_key(:gold)
  end
end
