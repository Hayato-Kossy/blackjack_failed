# app/models/deck.rb
class Deck < ApplicationRecord
    has_many :cards
  
    def build_deck
      Card.suits.keys.each do |suit|
        Card.ranks.keys.each do |rank|
          cards.build(suit: suit, rank: rank)
        end
      end
      cards.shuffle!
    end
  end
  