class CreateTagtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :tagtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
