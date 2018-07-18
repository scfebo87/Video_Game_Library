class AddGamesCountToConsoles < ActiveRecord::Migration[5.2]
  def change
      add_column :consoles, :games_count, :integer
  end
end
