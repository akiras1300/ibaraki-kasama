class AddColumnToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :jyun, :integer
    add_column :urls, :image, :text
  end
end
