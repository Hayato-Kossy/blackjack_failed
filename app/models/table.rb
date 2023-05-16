# app/models/table.rb
class Table < ApplicationRecord
    has_one :dealer
    has_many :players
    has_many :game_decisions, through: :players
  
    def deck
      @deck ||= Deck.new
    end
  
    def deal_initial_cards
      2.times do
        players.each do |player|
          deal_card(player)
        end
        deal_card(dealer)
      end
    end
  
    def deal_card(player)
      card = deck.cards.pop
      player.cards << card
    end
  end
  