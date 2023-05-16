# app/controllers/games_controller.rb
class GamesController < ApplicationController
    def new
      @game = Game.new
    end
  
    # app/controllers/games_controller.rb

    def create
        @game = Game.new(game_params)
        @deck = Deck.new # デッキオブジェクトを作成

        @game.deck = @deck # @gameオブジェクトのdeck属性にデッキオブジェクトを代入        
        if @game.save
        @game.deal_initial_cards # カードを配る処理を追加
    
        redirect_to game_path(@game)
        else
        render :new
        end
    end

    def show
      @game = Game.find(params[:id])
    end
  
    def hit
      @game = Game.find(params[:id])
      @game.player_hit
      redirect_to game_path(@game)
    end
  
    def surrender
      @game = Game.find(params[:id])
      @game.player_surrender
      redirect_to game_path(@game)
    end
  
    private
  
    def game_params
      # パラメータの設定
      params.require(:game).permit(:player_name)
    end
  end
  