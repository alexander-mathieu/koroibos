require 'rails_helper'

RSpec.describe 'Olympian stats endpoint' do
  before :each do
    @o1 = create(:olympian, sex: 'F', age: 15, height: 160, weight: 60)
    @o2 = create(:olympian, sex: 'F', age: 20, height: 165, weight: 65)
    @o3 = create(:olympian, sex: 'F', age: 25, height: 170, weight: 70)
    @o4 = create(:olympian, sex: 'F', age: 30, height: 175, weight: 75)
    @o5 = create(:olympian, sex: 'M', age: 25, height: 160, weight: 75)
    @o6 = create(:olympian, sex: 'M', age: 30, height: 185, weight: 80)
    @o7 = create(:olympian, sex: 'M', age: 30, height: 200, weight: 85)
    @o8 = create(:olympian, sex: 'M', age: 35, height: 205, weight: 100)
  end

  it 'returns stats on all Olympians' do
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    olympian_stats = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    olympian_average_height = olympian_stats[:average_height]
    olympian_average_weight = olympian_stats[:average_weight]

    expect(olympian_stats[:total_competing_olympians]).to eq(8)
    expect(olympian_stats[:average_age]).to eq('26.25')

    expect(olympian_average_height[:unit]).to eq('cm')
    expect(olympian_average_height[:female_olympians]).to eq('167.5')
    expect(olympian_average_height[:male_olympians]).to eq('187.5')

    expect(olympian_average_weight[:unit]).to eq('kg')
    expect(olympian_average_weight[:female_olympians]).to eq('67.5')
    expect(olympian_average_weight[:male_olympians]).to eq('85.0')
  end
end
