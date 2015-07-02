class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :street
      t.string :city
      t.references :state, index: true
      t.references :country, index: true

      t.timestamps null: false
    end
    # add_foreign_key :locations, :states
    # add_foreign_key :locations, :countries
  end
end
