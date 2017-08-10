class AddEventToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :event, foreign_key: true
  end
end
