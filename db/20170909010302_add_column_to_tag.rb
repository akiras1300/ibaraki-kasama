class AddColumnToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :oya, :integer
  end
end
