class Sale < ApplicationRecord
  has_many :games_sales

  has_many :games, through: :games_sales

  validates :na_sales, presence: true
end
