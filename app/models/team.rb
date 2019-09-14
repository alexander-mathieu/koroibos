class Team < ApplicationRecord
  validates :name, presence: true

  has_many :olympians
end
