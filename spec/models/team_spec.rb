require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :olympians }
  end

  describe 'instance methods' do
    before :each do
      @t1 = create(:team)
      @t2 = create(:team)

      @o1 = create(:olympian, team: @t1)
      @o2 = create(:olympian, team: @t1)
      @o3 = create(:olympian, team: @t2)
      @o4 = create(:olympian, team: @t2)

      @e1 = create(:event, name: 'Event 1')
      @e2 = create(:event, name: 'Event 2')
      @e3 = create(:event, name: 'Event 3')
      @e4 = create(:event, name: 'Event 4')

      create(:olympian_event_with_medal, event: @e1, olympian: @o1, medal: 'Gold')
      create(:olympian_event_with_medal, event: @e1, olympian: @o2, medal: 'Silver')
      create(:olympian_event_with_medal, event: @e2, olympian: @o1, medal: 'Bronze')
      create(:olympian_event_with_medal, event: @e2, olympian: @o2, medal: 'Bronze')
      create(:olympian_event_with_medal, event: @e3, olympian: @o3, medal: 'Gold')
      create(:olympian_event_with_medal, event: @e4, olympian: @o4, medal: 'Gold')
    end

    it '#total_medal_count' do
      expect(@t1.total_medal_count).to eq(4)
      expect(@t2.total_medal_count).to eq(2)
    end

    it '#medal_count' do
      expect(@t1.medal_count('Bronze')).to eq(2)
      expect(@t1.medal_count('Silver')).to eq(1)
      expect(@t1.medal_count('Gold')).to eq(1)

      expect(@t2.medal_count('Bronze')).to eq(0)
      expect(@t2.medal_count('Silver')).to eq(0)
      expect(@t2.medal_count('Gold')).to eq(2)
    end
  end
end
