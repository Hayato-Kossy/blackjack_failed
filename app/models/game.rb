# game.rb
class Game < ApplicationRecord
    serialize :player_cards, Array
    serialize :dealer_cards, Array
    def deck=(deck)
        @deck = deck
      end
    def initialize_deck
      @deck = Deck.new
      @deck.build_deck
    end
  
    def deal_initial_cards
      initialize_deck
  
      self.player_cards = []
      self.dealer_cards = []
  
      2.times do
        player_cards << deck.draw_card
        dealer_cards << deck.draw_card
      end
  
      save
    end
  
    def player_total_points
      calculate_total_points(player_cards)
    end
  
    def dealer_total_points
      calculate_total_points(dealer_cards)
    end
  
    def player_turn?
      player_total_points < 21 && !game_over?
    end
  
    def game_over?
      player_total_points >= 21 || dealer_total_points >= 21
    end
  
    def player_won?
      player_total_points <= 21 && (dealer_total_points > 21 || player_total_points > dealer_total_points)
    end
  
    def dealer_won?
      dealer_total_points <= 21 && (player_total_points > 21 || dealer_total_points > player_total_points)
    end
  
    private
  
    def calculate_total_points(cards)
      total = 0
      aces_count = 0
  
      cards.each do |card|
        total += card.value
        aces_count += 1 if card.rank == "ace"
      end
  
      while total > 21 && aces_count > 0
        total -= 10
        aces_count -= 1
      end
  
      total
    end
  end
  