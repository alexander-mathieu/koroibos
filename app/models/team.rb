class Team < ApplicationRecord
  validates :name, presence: true

  has_many :olympians

  def total_medal_count
    olympians
    .joins(:events)
    .merge(OlympianEvent.medalled_events)
    .count
  end

  def medal_count(medal)
    olympians
    .joins(:events)
    .where(olympian_events: { medal: medal })
    .count
  end
end
