class Sport < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :events
  has_many :olympian_sports
  has_many :olympians, through: :olympian_sports
end
