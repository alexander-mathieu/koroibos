class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :team

  has_many :events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports
end
