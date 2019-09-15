require 'rails_helper'

RSpec.describe Olympian, type: :model do
  before :each do
    @o1, @o2, @o3, @o4 = create_list(:olympian, 4)
    @o5 = create(:olympian, age: 14)
    @o6 = create(:olympian, age: 42)

    create_list(:olympian_event_with_medal, 4, olympian: @o2)
    create_list(:olympian_event_with_medal, 2, olympian: @o4)
    create_list(:olympian_event_with_medal, 1, olympian: @o1)
    create_list(:olympian_event_without_medal, 2, olympian: @o4)
    create_list(:olympian_event_without_medal, 1, olympian: @o2)
    create_list(:olympian_event_without_medal, 0, olympian: @o3)
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'relationships' do
    it { should belong_to :team }
    it { should have_many :olympian_events }
    it { should have_many(:events).through(:olympian_events) }
    it { should have_many :olympian_sports }
    it { should have_many(:sports).through(:olympian_sports) }
  end

  describe 'instance methods' do
    it '#total_medal_count' do
      expect(@o1.total_medal_count).to eq(1)
      expect(@o2.total_medal_count).to eq(4)
      expect(@o3.total_medal_count).to eq(0)
      expect(@o4.total_medal_count).to eq(2)
    end
  end

  describe 'class methods' do
    it '.youngest_olympian' do
      expect(Olympian.youngest_olympian).to eq(@o5)
    end

    it '.oldest_olympian' do
      expect(Olympian.oldest_olympian).to eq(@o6)
    end
  end
end
