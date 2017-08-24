class AddCheckToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :check, :integer
  end
end
