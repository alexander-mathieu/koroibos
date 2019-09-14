class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  belongs_to :team
end
