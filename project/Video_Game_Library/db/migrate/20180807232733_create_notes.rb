class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
        t.string :description 
        t.integer :game_id
    end
  end
end
