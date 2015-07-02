class CreateTransportTypes < ActiveRecord::Migration
  def change
    create_table :transport_types do |t|
      t.string :label
      t.string :identifier

      t.timestamps null: false
    end
  end
end
