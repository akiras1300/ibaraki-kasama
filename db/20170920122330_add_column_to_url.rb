class AddColumnToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :tag_id, :integer
  end
end
