class AddTagToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :places, :tag, foreign_key: true
  end
end
