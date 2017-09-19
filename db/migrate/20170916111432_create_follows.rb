class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :from_tag_id, null: false
      t.integer :to_tag_id, null: false

      t.timestamps

      t.index :from_tag_id
      t.index :to_tag_id
      t.index [:from_tag_id, :to_tag_id], unique: true
    end
  end
end
