class ChangeColumnToRate < ActiveRecord::Migration[5.1]
  def change
    rename_column :rates, :url, :siteurl
  end
end
