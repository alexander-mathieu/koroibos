class Sport < ApplicationRecord
  has_many :olympian_sports
  has_many :olympians, through: :olympian_sports
end
