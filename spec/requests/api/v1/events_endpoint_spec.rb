require 'rails_helper'

RSpec.describe 'events endpoint spec' do
  it 'returns all events broken down by sport' do
    s1, s2, s3, s4 = create_list(:sport, 4)

    create(:event, sport: s1)
    create(:event, sport: s1)
    create(:event, sport: s2)
    create(:event, sport: s2)
    create(:event, sport: s3)
    create(:event, sport: s3)
    create(:event, sport: s4)
    create(:event, sport: s4)

    get '/api/v1/events'

    events_by_sport = JSON.parse(response.body, symbolize_names: true)[:data]
    first_sport_event = events_by_sport[0][:attributes]

    expect(events_by_sport.count).to eq(4)

    expect(first_sport_event).to have_key(:name)
    expect(first_sport_event[:events]).to be_an(Array)
    expect(first_sport_event[:events].count).to eq(2)
  end
end
