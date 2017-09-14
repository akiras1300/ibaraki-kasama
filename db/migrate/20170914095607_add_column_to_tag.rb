class AddColumnToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :image, :text
  end
end
