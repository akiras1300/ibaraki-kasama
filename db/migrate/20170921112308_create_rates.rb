class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :sitename
      t.float :rate
      t.integer :rcount
      t.string :url
      t.integer :tag_id

      t.timestamps
    end
  end
end
