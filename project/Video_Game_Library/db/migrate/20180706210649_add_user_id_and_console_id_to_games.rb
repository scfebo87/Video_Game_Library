class AddUserIdAndConsoleIdToGames < ActiveRecord::Migration[5.2]
 def change
    add_column :games, :user_id, :integer
    add_column :games, :console_id, :integer
  end
end
