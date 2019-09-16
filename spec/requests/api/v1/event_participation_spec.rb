require 'rails_helper'

RSpec.describe 'event participation endpoint' do
  it 'returns event participation for each team' do
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

    get '/api/v1/event_participation'

    teams = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:team_participation]
    team = teams[0]
    team_events = team[:events]

    expect(teams.count).to eq(2)

    expect(team).to have_key(:team)
    expect(team).to have_key(:event_participation)
    expect(team).to have_key(:percentage)
    expect(team_events[0]).to eq('Event 1')
    expect(team_events[1]).to eq('Event 2')
  end
end
