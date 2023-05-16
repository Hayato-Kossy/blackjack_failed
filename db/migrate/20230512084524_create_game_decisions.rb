class CreateGameDecisions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_decisions do |t|

      t.timestamps
    end
  end
end
