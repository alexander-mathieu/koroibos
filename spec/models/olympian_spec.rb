require 'rails_helper'

RSpec.describe Olympian, type: :model do
  before :each do
    @o1 = create(:olympian, sex: 'F', age: 14, height: 160, weight: 60)
    @o2 = create(:olympian, sex: 'F', age: 20, height: 165, weight: 65)
    @o3 = create(:olympian, sex: 'F', age: 25, height: 170, weight: 70)
    @o4 = create(:olympian, sex: 'F', age: 30, height: 175, weight: 75)
    @o5 = create(:olympian, sex: 'M', age: 25, height: 160, weight: 75)
    @o6 = create(:olympian, sex: 'M', age: 30, height: 185, weight: 80)
    @o7 = create(:olympian, sex: 'M', age: 30, height: 200, weight: 85)
    @o8 = create(:olympian, sex: 'M', age: 42, height: 205, weight: 100)

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
      expect(Olympian.youngest_olympian).to eq(@o1)
    end

    it '.oldest_olympian' do
      expect(Olympian.oldest_olympian).to eq(@o8)
    end

    it '.total_competing_olympians' do
      expect(Olympian.total_competing_olympians).to eq(8)
    end

    it '.olympian_average' do
      expect(Olympian.olympian_average('height', 'F')).to eq(167.5)
      expect(Olympian.olympian_average('height', 'M')).to eq(187.5)

      expect(Olympian.olympian_average('weight', 'F')).to eq(67.5)
      expect(Olympian.olympian_average('weight', 'M')).to eq(85)

      expect(Olympian.olympian_average('age', [ 'F', 'M' ])).to eq(27)
    end
  end
end
