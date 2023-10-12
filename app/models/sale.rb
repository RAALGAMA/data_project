class Sale < ApplicationRecord
  has_many :games_sales

  has_many :games, through: :games_sales

  validates :na_sales, presence: true
  validates :eu_sales, presence: true
  validates :jp_sales, presence: true
  validates :other_sales, presence: true
  validates :global_sales, presence: true
end
