class AddColumnToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :image, :text
  end
end
