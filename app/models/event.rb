class Event < ApplicationRecord
  validates :name, presence: true, unique: true

  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
end
