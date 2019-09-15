require 'rails_helper'

RSpec.describe 'Olympians endpoint' do
  it 'returns a list of all Olympians' do
    o1, o2, o3, o4 = create_list(:olympian, 4)

    create_list(:olympian_event, 4, olympian: o1)
    create_list(:olympian_event, 4, olympian: o2)
    create_list(:olympian_event, 4, olympian: o3)
    create_list(:olympian_event, 4, olympian: o4)


    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(olympians.count).to eq(10)

    expect(olympians[0]).to have_key(:age)
    expect(olympians[0]).to have_key(:name)
    expect(olympians[0]).to have_key(:sport)
    expect(olympians[0]).to have_key(:team)
    expect(olympians[0]).to have_key(:total_medals_won)
  end
end
