class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :olympian_sports
  has_many :sports, through: :olympian_sports

  enum sex: [ 'M', 'F' ]

  default_scope { order(:id) }

  def total_medal_count
    olympian_events
    .merge(OlympianEvent.medalled_events)
    .count
  end

  def self.youngest_olympian
    find_by(age: minimum(:age))
  end

  def self.oldest_olympian
    find_by(age: maximum(:age))
  end

  def self.total_competing_olympians
    Olympian.count
  end

  def self.olympian_average(attribute, gender)
    where(sex: gender)
    .average(attribute)
  end

  def self.event_medalists(event_id)
    select('olympians.*, olympian_events.medal AS medal')
    .joins(:events)
    .merge(OlympianEvent.medalled_events)
    .where('events.id = ?', event_id)
  end
end
