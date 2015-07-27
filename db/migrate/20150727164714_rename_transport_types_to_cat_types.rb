class RenameTransportTypesToCatTypes < ActiveRecord::Migration
  def change
    rename_table :transport_types, :car_types
  end
end
