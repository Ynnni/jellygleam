class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.text :notice
      t.references :user, index: true
      t.references :trip, index: true

      t.timestamps null: false
    end
    # add_foreign_key :subscribers, :users
    # add_foreign_key :subscribers, :trips
  end
end
