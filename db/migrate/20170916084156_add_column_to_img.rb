class AddColumnToImg < ActiveRecord::Migration[5.1]
  def change
    add_column :imgs, :inyo, :string
  end
end
