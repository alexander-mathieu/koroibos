require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :olympian_sports }
    it { should have_many(:olympians).through(:olympian_sports) }
  end
end
