# app/models/dealer.rb
class Dealer < ApplicationRecord
    has_many :cards, as: :cardable
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
  
    def deal_to_self
      while total_points < 17
        deal_card(self)
      end
    end
  
    def deal_card(cardable)
      card = table.deck.cards.pop
      card.update(cardable: cardable)
    end
  end
  