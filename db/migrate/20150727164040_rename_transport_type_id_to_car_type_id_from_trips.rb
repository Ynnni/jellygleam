class RenameTransportTypeIdToCarTypeIdFromTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :transport_type_id, :car_type_id
  end
end
