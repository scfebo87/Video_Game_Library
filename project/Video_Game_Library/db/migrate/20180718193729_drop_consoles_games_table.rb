class DropConsolesGamesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :consoles_games
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
