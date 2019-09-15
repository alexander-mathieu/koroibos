require 'rails_helper'

RSpec.describe Olympian, type: :model do
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
      o1, o2, o3, o4 = create_list(:olympian, 4)

      create_list(:olympian_event_with_medal, 4, olympian: o2)
      create_list(:olympian_event_with_medal, 2, olympian: o4)
      create_list(:olympian_event_with_medal, 1, olympian: o1)
      create_list(:olympian_event_without_medal, 2, olympian: o4)
      create_list(:olympian_event_without_medal, 1, olympian: o2)
      create_list(:olympian_event_without_medal, 0, olympian: o3)

      expect(o1.total_medal_count).to eq(1)
      expect(o2.total_medal_count).to eq(4)
      expect(o3.total_medal_count).to eq(0)
      expect(o4.total_medal_count).to eq(2)
    end
  end

  describe 'class methods' do
    it '.youngest_olympian' do
      create_list(:olympian, 4)

      youngest_olympian = create(:olympian, age: 14)

      expect(Olympian.youngest_olympian).to eq(youngest_olympian)
    end

    it '.oldest_olympian' do
      create_list(:olympian, 4)
      
      oldest_olympian = create(:olympian, age: 42)

      expect(Olympian.oldest_olympian).to eq(oldest_olympian)
    end
  end
end
