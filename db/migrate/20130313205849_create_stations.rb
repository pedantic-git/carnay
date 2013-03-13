class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :code
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
