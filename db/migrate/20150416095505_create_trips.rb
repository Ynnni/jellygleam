class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :start_location, index: true
      t.references :end_location, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.references :group, index: true
      t.references :owner, index: true
      t.references :transport_type, index: true
      t.integer :max_people
      t.float :max_baggage_weight

      t.timestamps null: false
    end
    # add_foreign_key :trips, :start_locations
    # add_foreign_key :trips, :end_locations
    # add_foreign_key :trips, :owners
    # add_foreign_key :trips, :groups
  end
end
