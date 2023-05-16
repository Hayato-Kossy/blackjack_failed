class AddPlayerNameToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :player_name, :string
  end
end
