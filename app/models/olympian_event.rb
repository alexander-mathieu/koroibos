class OlympianEvent < ApplicationRecord
  validates :medal, presence: true

  belongs_to :event
  belongs_to :olympian

  enum medal: [ 'NA', 'Bronze', 'Silver', 'Gold' ]

  scope :medalled_events, -> { where.not(medal: 0) }
end
