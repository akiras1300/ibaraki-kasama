class ChangeColumnToEvent < ActiveRecord::Migration[5.1]
  # 変更内容
   def up
     change_column :events, :image, :text
   end

   # 変更前の状態
   def down
     change_column :events, :image, :string
   end
end
