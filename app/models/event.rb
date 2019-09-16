class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def self.team_participation_percentage(team_id)
    (team_events(team_id).count).fdiv(self.count)
  end

  def self.team_events(team_id)
    select('events.*')
    .joins(olympians: :team)
    .where(teams: { id: team_id })
    .uniq
    .pluck(:name)
  end
end
