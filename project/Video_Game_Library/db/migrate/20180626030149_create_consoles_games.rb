class CreateConsolesGames < ActiveRecord::Migration[5.2]
  def change
    create_table :consoles_games do |t|
        t.integer :console_id
        t.integer :game_id
    end
  end
end
