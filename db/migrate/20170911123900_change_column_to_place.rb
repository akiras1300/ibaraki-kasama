class ChangeColumnToPlace < ActiveRecord::Migration[5.1]
  def change
    rename_column :places, :type, :ptype
  end
end
