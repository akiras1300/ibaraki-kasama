class ChangeColumnToRate < ActiveRecord::Migration[5.1]
  def change
    rename_column :rates, :sitename, :url_id
  end
end
