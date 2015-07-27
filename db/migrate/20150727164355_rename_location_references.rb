class RenameLocationReferences < ActiveRecord::Migration
  def change
    rename_column :trips, :start_location_id, :start_point_id
    rename_column :trips, :end_location_id, :end_point_id
  end
end
