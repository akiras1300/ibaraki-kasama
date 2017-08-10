class AddTagToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :tag, foreign_key: true
  end
end
