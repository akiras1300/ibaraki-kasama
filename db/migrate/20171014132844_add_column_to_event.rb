class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :place, :string
    add_column :events, :kibo, :string
    remove_column :events, :image, :string
  end
end
