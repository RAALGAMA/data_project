class GamesSale < ApplicationRecord
  belongs_to :game, optional: true
  belongs_to :sale, optional: true
end
