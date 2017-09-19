class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :content
      t.text :image

      t.timestamps
    end
  end
end
