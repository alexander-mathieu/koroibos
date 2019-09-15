require 'rails_helper'

RSpec.describe 'Olympians endpoint' do
  before :each do
    @o1, @o2, @o3, @o4 = create_list(:olympian, 4)
    @o5 = create(:olympian, age: 14)
    @o6 = create(:olympian, age: 42)

    create_list(:olympian_event, 3, olympian: @o1)
    create_list(:olympian_event, 3, olympian: @o2)
    create_list(:olympian_event, 3, olympian: @o3)
    create_list(:olympian_event, 3, olympian: @o4)
  end

  it 'returns a list of all Olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body, symbolize_names: true)[:data]
    first_olympian = olympians[0][:attributes]

    expect(olympians.count).to eq(6)

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

  it 'returns the youngest Olympian' do
    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    olympian = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(olympian[:age]).to eq(14)
  end

  it 'returns the oldest Olympian' do
    get '/api/v1/olympians?age=oldest'

    expect(response).to be_successful

    olympian = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(olympian[:age]).to eq(42)
  end
end
