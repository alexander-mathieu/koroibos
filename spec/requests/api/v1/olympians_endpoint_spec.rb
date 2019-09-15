require 'rails_helper'

RSpec.describe 'Olympians endpoint' do
  it 'returns a list of all Olympians' do
    o1, o2, o3, o4 = create_list(:olympian, 4)

    create_list(:olympian_event, 3, olympian: o1)
    create_list(:olympian_event, 3, olympian: o2)
    create_list(:olympian_event, 3, olympian: o3)
    create_list(:olympian_event, 3, olympian: o4)

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)[:data]
    first_olympian = olympians[0][:attributes]

    expect(olympians.count).to eq(4)

    expect(first_olympian).to have_key(:age)
    expect(first_olympian[:age]).to be_an(Integer)

    expect(first_olympian).to have_key(:name)
    expect(first_olympian[:name]).to be_a(String)

    expect(first_olympian).to have_key(:sports)
    expect(first_olympian[:sports]).to be_an(Array)

    expect(first_olympian).to have_key(:team)
    expect(first_olympian[:team]).to be_a(Hash)

    expect(first_olympian).to have_key(:total_medal_count)
    expect(first_olympian[:total_medal_count]).to be_an(Integer)
  end
end
