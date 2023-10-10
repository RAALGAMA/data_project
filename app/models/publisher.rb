class Publisher < ApplicationRecord
  validates :name, presence: true
  has_many :games
  #   def self.ordered_by_games
  #     self.select("")
  #   end
end
