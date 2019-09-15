class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports

  enum sex: [ 'M', 'F' ]

  def total_medal_count
    olympian_events.where.not(medal: 0).count
  end
end
