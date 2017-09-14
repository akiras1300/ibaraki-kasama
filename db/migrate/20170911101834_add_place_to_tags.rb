class AddPlaceToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :place, foreign_key: true
  end
end
