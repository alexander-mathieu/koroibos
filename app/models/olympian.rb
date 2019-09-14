class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports

  enum sex: [ 'M', 'F' ]
end
