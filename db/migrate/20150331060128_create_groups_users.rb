class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.index :group_id
      t.index :user_id
    end
  end
end
