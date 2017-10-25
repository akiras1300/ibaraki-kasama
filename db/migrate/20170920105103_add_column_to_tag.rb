class AddColumnToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :facebook, :string
    add_column :tags, :twitter, :string
    add_column :tags, :instagram, :string
  end
end
