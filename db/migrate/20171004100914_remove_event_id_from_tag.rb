class RemoveEventIdFromTag < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags, :event_id, :integer
    remove_column :tags, :place_id, :integer
  end
end
