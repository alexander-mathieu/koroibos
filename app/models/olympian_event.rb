class OlympianEvent < ApplicationRecord
  validates :medal, presence: true

  belongs_to :event
  belongs_to :olympian
end
