require 'rails_helper'

RSpec.describe 'medalists endpoint' do
  it 'returns a list of all medalists broken down by event' do
    o1, o2, o3, o4 = create_list(:olympian, 4)

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

    get '/api/v1/medalists'

    events = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:event_medalists]
    event = events[0]
    first_event_medalists = event[:medalists][0]

    expect(events.count).to eq(4)
    expect(event).to have_key(:event)

    expect(first_event_medalists).to have_key(:name)
    expect(first_event_medalists).to have_key(:team)
    expect(first_event_medalists).to have_key(:age)
    expect(first_event_medalists).to have_key(:medal)
  end
end
