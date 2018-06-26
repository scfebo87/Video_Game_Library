class CreateConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :consoles do |t|
        t.string :name
        t.string :company
        t.string :model
    end
  end
end
