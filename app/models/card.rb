# app/models/card.rb
class Card < ApplicationRecord
    enum suit: [:hearts, :diamonds, :clubs, :spades]
    enum rank: [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
  
    def value
      if rank == "ace"
        11
      elsif ["jack", "queen", "king"].include?(rank)
        10
      else
        rank.to_i
      end
    end
  end
  