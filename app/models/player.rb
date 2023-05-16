# app/models/player.rb
class Player < ApplicationRecord
    has_many :game_decisions
    has_many :cards, through: :game_decisions
    belongs_to :table
  
    def total_points
      total = cards.sum(&:value)
      aces_count = cards.count(&:ace?)
      while total > 21 && aces_count > 0
        total -= 10
        aces_count -= 1
      end
      total
    end
  end
  