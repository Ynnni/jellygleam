class RenameSubscribersNoticeToMessage < ActiveRecord::Migration
  def change
    rename_column :subscribers, :notice, :message
  end
end
