require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validates' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name}
  end

  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:olympians).through(:olympian_events) }
  end

  describe 'class methods' do
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

      create(:olympian_event_with_medal, event: @e1, olympian: @o1)
      create(:olympian_event_with_medal, event: @e1, olympian: @o2)
      create(:olympian_event_with_medal, event: @e2, olympian: @o1)
      create(:olympian_event_with_medal, event: @e2, olympian: @o2)
      create(:olympian_event_with_medal, event: @e3, olympian: @o3)
      create(:olympian_event_with_medal, event: @e4, olympian: @o1)
    end

    it '.team_participation_percentage' do
      expect(Event.team_participation_percentage(@t1.id)).to eq(0.75)
      expect(Event.team_participation_percentage(@t2.id)).to eq(0.25)
    end

    it '.team_events' do
      expect(Event.team_events(@t1.id)).to eq(['Event 1', 'Event 2', 'Event 4'])
      expect(Event.team_events(@t2.id)).to eq(['Event 3'])
    end
  end
end
