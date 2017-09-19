class RenameImageToImg < ActiveRecord::Migration[5.1]
  def change
    rename_table :images, :imgs #この行を追加！
  end
end
