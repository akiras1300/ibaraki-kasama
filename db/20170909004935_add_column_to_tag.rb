class AddColumnToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :read, :string
    add_column :tags, :body, :text
  end
end
