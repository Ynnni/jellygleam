class AddPurposesToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :purposes, :text
  end
end
