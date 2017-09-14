class AddTagtypeToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :tagtype, foreign_key: true
  end
end
