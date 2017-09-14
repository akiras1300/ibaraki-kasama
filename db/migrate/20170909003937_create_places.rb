class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :adress
      t.string :tel
      t.string :open
      t.float :lat
      t.float :lng
      t.float :rate
      t.string :parking

      t.timestamps
    end
  end
end
