class ChangeStartToEvents < ActiveRecord::Migration[5.1]
  #変更後の型
  def up
    change_column :Events, :start, :date
    change_column :Events, :end, :date
  end

  #変更前の型
  def down
    change_column :Events, :start, :datetime
    change_column :Events, :end, :datetime
  end
end
