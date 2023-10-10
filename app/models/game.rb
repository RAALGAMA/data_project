class Game < ApplicationRecord
  belongs_to :publisher
  belongs_to :platform

  has_many :games_sales
  has_many :sales, through: :games_sales

  validates :name, presence: true
end
