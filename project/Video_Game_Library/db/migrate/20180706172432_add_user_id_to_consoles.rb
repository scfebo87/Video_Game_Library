class AddUserIdToConsoles < ActiveRecord::Migration[5.2]
  def change
    add_column :consoles, :user_id, :integer
  end
end
